import 'NetworkConnection.dart';

const apikey = 'e37c62c3b7msh41efba35561f2b3p1d8ef9jsn872a47246f3a';
const baseUrl = 'https://alpha-vantage.p.rapidapi.com';

//https://alpha-vantage.p.rapidapi.com/query?from_currency=ETH&function=CURRENCY_EXCHANGE_RATE&to_currency=UZS&rapidapi-key=e37c62c3b7msh41efba35561f2b3p1d8ef9jsn872a47246f3a
class CryptoCurrencyModel {
  final String typeCoin;
  final String typeCurrency;
  CryptoCurrencyModel({this.typeCoin,this.typeCurrency});


  Future<dynamic> getCyrrency() async {
    var url = '$baseUrl/query?from_currency=$typeCoin&function'
        '=CURRENCY_EXCHANGE_RATE&to_currency=$typeCurrency&rapidapi-key=$apikey';
    NetworkConnection networkConnection = new NetworkConnection(url: url);
    return await networkConnection.getDataCurrency();
  }
}
