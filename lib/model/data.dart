import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Data {
  static getPastData() async {
    var prefs = await SharedPreferences.getInstance();
    var savedData = prefs.getString('Pastevent');
    if (savedData == null) {
      savedData = '[]';
    }
    return json.decode(savedData);
  }

  static savePastData(data) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('Pastevent', json.encode(data));
  }
}
