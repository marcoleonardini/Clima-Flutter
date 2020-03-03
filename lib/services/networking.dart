import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    Response response = await get(url);
    return jsonDecode(response.body);
  }
}
