import 'dart:core';

import 'package:http/http.dart';

var client = Client();
void main() async {
  var hi = await client.get(Uri.https('www.naver.com', '/'));
  print(hi.statusCode);
}
