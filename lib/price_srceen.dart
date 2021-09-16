import 'package:bitcoin_ticker/CryptoCurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

const String BTC = 'BTC';
const String ETH = 'ETH';
const String LTC = 'LTC';

class PriceSceen extends StatefulWidget {
  //const PriceSceen({Key key}) : super(key: key);

  @override
  _PriceSceenState createState() => _PriceSceenState();
}

class _PriceSceenState extends State<PriceSceen> {
  String currency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                  cryptoCoin: "BTC",
                  costCoin: isWaiting ? '?' : coinValues['BTC'],
                  currency: currency),
              CryptoCard(
                  cryptoCoin: "ETH",
                  costCoin: isWaiting ? '?' : coinValues['ETH'],
                  currency: currency),
              CryptoCard(
                  cryptoCoin: "LTC",
                  costCoin: isWaiting ? '?' : coinValues['LTC'],
                  currency: currency),
            ],
          ),
          Container(
            color: Colors.lightBlue,
            height: 150,
            padding: EdgeInsets.only(bottom: 30),
            child: Center(
              child: CupertinoPicker(
                onSelectedItemChanged: (int value) async {
                  setState(() {
                    currency = currenciesList[value];
                    getData();
                  });
                },
                scrollController: FixedExtentScrollController(initialItem: 0),
                selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                  background: Color(0x281D1E23),
                ),
                itemExtent: 31.0,
                children: getListPicker(),
              ),
            ),
          )
        ],
      ),
    );
  }
//AbdumalikSapoqulov230699
//  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
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    CoinData coinData = CoinData();
    isWaiting = true;
    try {
      var data = await coinData.getCryptoCurrency(currency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
  }
}

//   void updateUI(dynamic data) {
//     if (data != null) {
//       var dataRes = data['Realtime Currency Exchange Rate']['5. Exchange Rate'];
//       costCoin=double.parse(dataRes).round();
//
//     }
//   }
// }

List<DropdownMenuItem<String>> getMenuItems() {
  List<DropdownMenuItem<String>> currencyList = [];
  for (int i = 0; i < currenciesList.length; i++) {
    var item = DropdownMenuItem(
      child: Text(
        currenciesList[i],
        style: TextStyle(color: Colors.white),
      ),
      value: currenciesList[i],
    );
    currencyList.add(item);
  }

  return currencyList;
}

List<Widget> getListPicker() {
  List<Widget> list = [];

  for (String item in currenciesList) {
    list.add(
      Text(
        item,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  return list;
}

// DropdownButton<String>(
// value: valueScreen,
// items:getMenuItems(),
// onChanged: (value) {
// setState(() {
// valueScreen = value;
// });
// },
// ),
//e37c62c3b7msh41efba35561f2b3p1d8ef9jsn872a47246f3a

class CryptoCard extends StatelessWidget {
  final String cryptoCoin;
  final String costCoin;
  final String currency;

  CryptoCard({this.cryptoCoin, this.costCoin, this.currency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlue,
        elevation: 10.0,
        shadowColor: Colors.pink,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCoin = $costCoin $currency',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
