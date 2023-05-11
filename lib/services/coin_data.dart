import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'B0D2B546-F169-4912-AABC-C6767B63A8EE';
const coinApiIoURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  Future<dynamic> getCoinData() async {
    String url = '$coinApiIoURL/BTC/USD?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var coinData = await networkHelper.getData();
    return coinData;
  }

}
