import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Prefrences {
  addData(String countryName, String stateName, String cityName) async {
    Map allData = {};

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString = prefs.getString('data');
    if (jsonString != null && jsonString.isNotEmpty) {
      allData = json.decode(jsonString);
      allData["${allData.length + 1}"] = {
        "country": countryName,
        "state": stateName,
        "city": cityName,
      };
      // print('Inside addData : ${allData.values}');
      var jsonToSave = json.encode(allData);
      await prefs.setString('data', jsonToSave).whenComplete(() {
        Fluttertoast.showToast(msg: 'Data Added to Local Storage');
        print('Inside whenComplete callback');
        print('RunType1: ${jsonToSave.runtimeType}');
        print('RunType2: ${allData.runtimeType}');
      });
    } else {
      allData["1"] = {
        "country": countryName,
        "state": stateName,
        "city": cityName,
      };
      String jsonToSave = json.encode(allData);
      await prefs.setString('data', jsonToSave);
    }
  }

  Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> allData;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String jsonString = prefs.getString('data');
      if (jsonString != null && jsonString.isNotEmpty) {
        allData = json.decode(jsonString);
        // print('insidegetdata :$allData');
        return allData;
      } else {
        return {};
      }
    } catch (e) {
      print('inside catch block');
      return e;
    }
  }
}
