import 'dart:convert';

import 'package:covid/models/level_models.dart';
import 'package:http/http.dart' as http;

class Network {
  String url = "https://coronavirus-19-api.herokuapp.com/countries";

  Future<Welcometext> getapi() async {
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print("cant get $url");
    }
    var data = jsonDecode(response.body);
    return Welcometext.fromjson(data);
  }
}
