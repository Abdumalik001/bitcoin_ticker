import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkConnection {
  String url;
  NetworkConnection({this.url});



  Future<dynamic> getDataCurrency() async{

    http.Response response= await http.get(Uri.parse(url));

    if (response.statusCode==200){
      var jsonDecod=jsonDecode(response.body);
      return jsonDecod;
    }
    else{
      return response.statusCode;
    }
  }


}