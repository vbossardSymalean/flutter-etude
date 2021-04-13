import 'dart:convert';

import 'package:flutter/services.dart';

loadJson(String asset) async {
  print("Valeur de asset : $asset");
  String data = await rootBundle.loadString(asset);
  return json.decode(data);
}
