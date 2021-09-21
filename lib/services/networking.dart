import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String uri;
  NetworkHelper(this.uri);

  Future getData() async {
    Uri url = Uri.parse(uri);

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else
      return;
  }
}
