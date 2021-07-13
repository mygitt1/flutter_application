import 'package:flutter/cupertino.dart';
import 'package:flutter_application/model/data.dart';

import 'prefrences.dart';

class DataProvider extends ChangeNotifier {
  Prefrences prefrences = Prefrences();
  List<Data> listOfData = [];

  addData(Data data) {
    listOfData.add(data);
    prefrences.addData(
      data.countryName,
      data.stateName,
      data.cityName,
    );
  }
}
