<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Log;
use App\Models\User;
use App\Models\OIData;
use App\Models\Automation;
use App\Models\OptionOrder;


class AutomatedController extends Controller
{
    /**
     * Log for alrets.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $logs = Automation::where('user_id', Auth::user()->id)->get();
        return view('automated.index', [
            'logs' => $logs
        ]);

    }
    public function add(Request $request)
    {
        $data = json_decode(file_get_contents('php://input'), true);
        $log = new Log;
        $log->user_id = 1;
        $log->title = $data['title'];
        $log->message = $data['message'];
        $log->type = $data['type'];
        $log->price = $data['price'];
        $log->status = "Pending";
        $log->save();
    }

    public function runStrategies()
    {
        $logs = Automation::where('status', 1)->get();
        date_default_timezone_set('Asia/Kolkata');
        $currentTime = date('Hi');

        foreach ($logs as $log) {
            $data = json_decode($log->data, false);
            // Check if the trigger type is 'time' and if it matches the current time
            if (strtolower($data->entry_trigger->type) == 'time' && $data->entry_trigger->value == $currentTime) {
                switch ($data->asset->symbol) {
                    case "NIFTY": {
                        // Initialize option data
                        $optionData = null;
                        // Check asset type and fetch option chain
                        if (in_array("PE", $data->asset->type)) {
                            $optionDataPE = $this->niftyOptionChain($data->asset->expiry->cycle, $data->asset->expiry->frequency, 'PE');
                            $stock = $this->getValue($optionDataPE, $data->contract_value->type, 'PE', $data->contract_value->value);
                            $this->stockBuy($stock,$data->lot_size * 25, $data->risk_management, $data->actions->entry);
                        }

                        if (in_array("CE", $data->asset->type)) {
                            $optionDataCE = $this->niftyOptionChain($data->asset->expiry->cycle, $data->asset->expiry->frequency, 'CE');
                            $stock = $this->getValue($optionDataCE, $data->contract_value->type, 'CE', $data->contract_value->value);
                            $this->stockBuy($stock,$data->lot_size * 25, $data->risk_management, $data->actions->entry);
                            //print_r($row);
                        }


                        break;
                    }

                    // Add cases for other asset symbols if needed
                }
            }
        }
    }

    public function niftyOptionChain($cycle, $frequency, $optionType)
    {
        // Month mapping: Use 'O', 'N', 'D' for Oct, Nov, Dec; numbers for others
        $months = array(
            'Jan' => 1,
            'Feb' => 2,
            'Mar' => 3,
            'Apr' => 4,
            'May' => 5,
            'Jun' => 6,
            'Jul' => 7,
            'Aug' => 8,
            'Sep' => 9,
            'Oct' => 'O',  // October is 'O'
            'Nov' => 'N',  // November is 'N'
            'Dec' => 'D'   // December is 'D'
        );

        $apiUrl = "https://api-t1.fyers.in/data/quotes";
        $user = User::find(3);

        // Fetch NIFTY Index data
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $apiUrl . '?symbols=NSE:NIFTY50-INDEX',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $user->api_id . ':' . $user->access_token
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);

        $data = json_decode($response);
        if (!$data || !isset($data->d[0]->v->open_price)) {
            return ['error' => 'Failed to fetch NIFTY data'];
        }

        // NIFTY open price and rounding to nearest 100
        $openPrice = $data->d[0]->v->open_price;
        $openPriceRound = floor($openPrice - ($openPrice % 100));

        // Generate option chain expiry code
        $optionChain = [];
        $year = date('y');
        $month = $months[date('M', strtotime('Next Thursday'))];

        // Determine expiry code based on frequency and cycle
        if ($frequency === 'weekly') {
            // Weekly expiry: Determine the correct date based on the cycle
            if ($cycle === 'current') {
                $date = date('d', strtotime('this Thursday'));
            } elseif ($cycle === 'next') {
                $date = date('d', strtotime('next Thursday'));
            } else {
                return ['error' => 'Invalid cycle. Use "current" or "next".'];
            }
            $code = $year . $month . str_pad($date, 2, '0', STR_PAD_LEFT);
        } elseif ($frequency === 'monthly') {
            // Monthly expiry: Determine the correct date based on the cycle
            if ($cycle === 'current') {
                $lastThursday = date('d', strtotime('Last Thursday of this month'));
                $code = $year . $month . str_pad($lastThursday, 2, '0', STR_PAD_LEFT);
            } elseif ($cycle === 'next') {
                $nextMonthLastThursday = date('d', strtotime('Last Thursday of next month'));
                $nextMonth = date('M', strtotime('Next Month'));
                $nextMonthCode = $months[$nextMonth];
                $code = ($year + 1) . $nextMonthCode . str_pad($nextMonthLastThursday, 2, '0', STR_PAD_LEFT);
            } else {
                return ['error' => 'Invalid cycle. Use "current" or "next".'];
            }
        } else {
            return ['error' => 'Invalid frequency. Use "weekly" or "monthly".'];
        }

        // Generate strike prices and option symbols based on optionType (PE or CE)
        for ($i = -3000; $i <= 3000; $i += 50) {
            $strikePrice = $openPriceRound + $i;
            if ($optionType == 'PE') {
                $optionChain[] = "NSE:NIFTY" . $code . $strikePrice . "PE"; // Put Option
            } elseif ($optionType == 'CE') {
                $optionChain[] = "NSE:NIFTY" . $code . $strikePrice . "CE"; // Call Option
            }
        }

        // Convert array to comma-separated string for API request
        $symbolsString = implode(',', $optionChain);

        // Fetch option quotes data from Fyers API
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $apiUrl . '?symbols=' . $symbolsString,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $user->api_id . ':' . $user->access_token
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);

        $optionData = json_decode($response);

        // Return option chain data or handle error
        if (!$optionData) {
            return ['error' => 'Failed to fetch option chain data'];
        }

        return $optionData;
    }


    public function getValue($data, $type, $optionType, $value)
    {
        // Initialize the variable to store the result
        $mostSuitableRow = null;

        // Define a function to get the closest value

        // Determine the order of iteration based on optionType and the type of comparison
        if ($optionType === 'PE') {
            if ($type === 'lessThanOrEqual') {
                // Reverse the array for lessThanOrEqual when optionType is 'PE'
                $data->d = array_reverse($data->d);
            }
            // For greaterThanOrEqual, iterate in normal order
        } elseif ($optionType === 'CE') {
            if ($type === 'greaterThanOrEqual') {
                // Reverse the array for greaterThanOrEqual when optionType is 'CE'
                $data->d = array_reverse($data->d);
            }
            // For lessThanOrEqual, iterate in normal order
        }

        switch ($type) {
            case 'greaterThanOrEqual':
                // Find the first row where lp is greater than or equal to $value
                foreach ($data->d as $row) {
                    if ($row->v->lp >= $value) {
                        $mostSuitableRow = $row;
                        break;
                    }
                }
                break;

            case 'lessThanOrEqual':
                // Find the first row where lp is less than or equal to $value
                foreach ($data->d as $row) {
                    if ($row->v->lp <= $value) {
                        $mostSuitableRow = $row;
                        break;
                    }
                }
                break;

            case 'CLOSEST':
                // Find the closest lp value to $value
                $mostSuitableRow = $this->getClosest($data->d, $value);
                break;

            case 'BETWEEN':
                // Find the first row where lp is between $value['min'] and $value['max']
                foreach ($data->d as $row) {
                    if ($row->v->lp >= $value[0] && $row->v->lp <= $value[1]) {
                        $mostSuitableRow = $row;
                        break;
                    }
                }
                break;

            default:
                // Return null for invalid $type
                return null;
        }

        // Return the most suitable row
        return $mostSuitableRow;
    }

    function getClosest($rows, $target)
    {
        $closest = null;
        foreach ($rows as $row) {
            if ($closest === null || abs($row->v->lp - $target) < abs($closest->v->lp - $target)) {
                $closest = $row;
            }
        }
        return $closest;
    }

    public function stockBuy($stock, $qty, $riskManagement, $action = 'buy')
    {
        // Fetch user details
        $user = User::find(3);
        $symbol = $stock->v->symbol;

        // Use the last traded price (LTP) directly for the market order
        $ltp = $stock->v->lp;

        // Extract stop loss and take profit from the risk management object
        $slType = $riskManagement->stop_loss->type; // Changed to object access
        $slValue = $riskManagement->stop_loss->value; // Changed to object access
        $tpType = $riskManagement->take_profit->type; // Changed to object access
        $tpValue = $riskManagement->take_profit->value; // Changed to object access

        // Initialize stop loss and take profit values
        $stopLoss = 0;
        $takeProfit = 0;

        // Calculate stop loss based on type
        if ($slType === 'percentage') {
            $stopLoss = number_format((($ltp * $slValue) / 100), 2);
        } elseif ($slType === 'value') {
            $stopLoss = $slValue; // Direct value
        }

        // Calculate take profit based on type
        if ($tpType === 'percentage') {
            $takeProfit = number_format((($ltp * $tpValue) / 100), 2);
        } elseif ($tpType === 'value') {
            $takeProfit = $tpValue; // Direct value
        }

        // Round the prices to the nearest 0.25
        $takeProfit = floor($takeProfit / 0.25) * 0.25;
        $stopLoss = floor($stopLoss / 0.25) * 0.25;

        // Save order details to the database
        $order = new OptionOrder();
        $order->symbol = $symbol;
        $order->price = $ltp;  // Save LTP as the order price
        $order->user_id = $user->id;
        $order->ltp = $ltp;  // Store the last traded price
        $order->stop_loss = $stopLoss;
        $order->take_profit = $takeProfit;
        $order->side = $action;  // Save action type (buy/sell)
        //$order->save();

        // Determine the side of the order: 1 for buy, -1 for sell
        $side = ($action === 'sell') ? -1 : 1;

        // Prepare data for API request
        $data = array(
            "symbol" => $symbol,
            "qty" => $qty,
            "type" => 2,  // Market order
            "limitPrice" => 0,
            "stopPrice" => 0,
            "side" => $side,  // 1 for buy, -1 for sell
            "productType" => 'BO',  // Bracket Order
            "validity" => "DAY",
            "disclosedQty" => 0,
            "offlineOrder" => "False",
            "stopLoss" => floor($stopLoss),
            "takeProfit" => floor($takeProfit)
        );

        // Initialize cURL
        $curl = curl_init();

        // Set cURL options
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.fyers.in/api/v2/orders',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => json_encode($data),
            CURLOPT_HTTPHEADER => array(
                'Authorization: ' . $user->api_id . ':' . $user->access_token,
                'Content-Type: application/json'
            ),
        ));

        // Execute cURL request and handle response
        $response = curl_exec($curl);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        
        print_r($response);

        // Decode the response
        $resData = json_decode($response);

        // Check for errors in the response
        if ($httpCode !== 200 || isset($resData->error)) {
            // Handle error
            return [
                'success' => false,
                'message' => isset($resData->error) ? $resData->error : 'Error occurred while placing order.',
                'data' => $response
            ];
        }

        // Return success message or data
        return [
            'success' => true,
            'message' => 'Order placed successfully.',
            'data' => $resData
        ];
    }


}
