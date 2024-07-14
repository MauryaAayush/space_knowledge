import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../Model/model_class.dart';

class JsonProvider extends ChangeNotifier {
  List dataList = [];
  List<Planet> userList = [];

  JsonProvider() {
    print('--------------------- data called ----------------');
    jsonParsing();
    print('--------------------- Done ----------------');
  }

  Future<void> jsonParsing() async {
    String? json = await rootBundle.loadString('assets/json/data.json');
    dataList = jsonDecode(json);

    userList = dataList.map((e) => Planet.fromJson(e)).toList();
    notifyListeners();
  }
}
