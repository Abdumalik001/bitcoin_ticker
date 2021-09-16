import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'USD',
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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apikey = 'e37c62c3b7msh41efba35561f2b3p1d8ef9jsn872a47246f3a';
const baseUrl = 'https://alpha-vantage.p.rapidapi.com';

class CoinData {
  Future getCryptoCurrency(String currency) async {
    Map<String, String> cryptoCurrencyList = {};

    for (String crypto in cryptoList) {
      var url = '$baseUrl/query?from_currency=$crypto&function'
          '=CURRENCY_EXCHANGE_RATE&to_currency=$currency&rapidapi-key=$apikey';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        String rate = data['Realtime Currency Exchange Rate']['5. Exchange '
            'Rate'];
        double ratee=double.parse(rate);
        cryptoCurrencyList[crypto] = ratee.toStringAsFixed(0);

        print(cryptoCurrencyList);
      } else {
        print(response.statusCode);
        throw ('Problem with request');
      }
    }

    return cryptoCurrencyList;
  }
}
