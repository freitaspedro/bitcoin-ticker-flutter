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

  Future<dynamic> getBTCCoinData(String currency) async {
    String url = '$coinApiIoURL/BTC/$currency?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var coinData = await networkHelper.getData();
    return coinData;
  }

  Future<dynamic> getETHCoinData(String currency) async {
    String url = '$coinApiIoURL/ETH/$currency?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var coinData = await networkHelper.getData();
    return coinData;
  }

  Future<dynamic> getLTCCoinData(String currency) async {
    String url = '$coinApiIoURL/LTC/$currency?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var coinData = await networkHelper.getData();
    return coinData;
  }

}
