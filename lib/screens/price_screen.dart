import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/crypto_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  CoinData coin = CoinData();

  String selectedCurrency = 'USD';
  String btcRate;
  String ethRate;
  String ltcRate;

  @override
  void initState() {
    super.initState();
    updateUI(selectedCurrency);
  }

  void updateUI(String currency) async {
    final btcCoinData = await coin.getBTCCoinData(currency);
    final ethCoinData = await coin.getETHCoinData(currency);
    final ltcCoinData = await coin.getLTCCoinData(currency);
    setState(() {
      selectedCurrency = currency;
      if (btcCoinData == null || ethCoinData == null || ltcCoinData == null) {
        btcRate = ethRate = ltcRate = '?';
        return;
      }
      double btcR = btcCoinData['rate'];
      btcRate = btcR.toInt().toString();
      double ethR = ethCoinData['rate'];
      ethRate = ethR.toInt().toString();
      double ltcR = ltcCoinData['rate'];
      ltcRate = ltcR.toInt().toString();
    });
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropdownItems,
        onChanged: (value) {
          updateUI(value);
        },
      );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int selectedItem) {
        updateUI(currenciesList[selectedItem]);
      },
      children: pickerItems,
    );
  }

  Widget getPicker() {
    return (Theme.of(context).platform == TargetPlatform.iOS)
        ? iOSPicker() : androidDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                  crypto: 'BTC',
                  rate: btcRate,
                  selectedCurrency: selectedCurrency
              ),
              CryptoCard(
                  crypto: 'ETH',
                  rate: ethRate,
                  selectedCurrency: selectedCurrency
              ),
              CryptoCard(
                  crypto: 'LTC',
                  rate: ltcRate,
                  selectedCurrency: selectedCurrency
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
