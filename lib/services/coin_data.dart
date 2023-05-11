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
const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String url = '$coinApiURL/$crypto/$currency?apikey=$apiKey';
      NetworkHelper networkHelper = NetworkHelper(url);
      var coinData = await networkHelper.getData();
      try {
        double price = coinData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } catch (e) {
        print(e);
      }
    }
    return cryptoPrices;
  }

}
