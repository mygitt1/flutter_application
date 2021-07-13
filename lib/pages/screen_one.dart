import 'package:flutter/material.dart';
import 'package:flutter_application/model/data.dart';
import 'package:flutter_application/pages/screen_two.dart';
import 'package:flutter_application/provider/provider_data.dart';
import 'package:flutter_application/widgets/text_field.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  static const routeName = '/screen-one';

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final formKey = GlobalKey<FormState>();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  @override
  void dispose() {
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen One'),
        backgroundColor: Colors.brown.shade900,
        actions: [
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(ScreenTwo.routeName);
              }),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyTextField(
                    hintText: 'Country Name',
                    controller: countryController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'required*';
                      }
                    }),
                MyTextField(
                    hintText: 'State Name',
                    controller: stateController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'required*';
                      }
                    }),
                MyTextField(
                  hintText: 'City Name',
                  controller: cityController,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'required*';
                    }
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: RaisedButton(
                    elevation: 6.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.brown.shade900,
                    onPressed: onTap,
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.brown.shade50,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTap() {
    bool isValid = formKey.currentState.validate();
    if (isValid) {
      Data data;
      data = Data(
          cityName: cityController.text,
          countryName: countryController.text,
          stateName: stateController.text);
      Provider.of<DataProvider>(context, listen: false).addData(data);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return ScreenTwo(
              country: data.countryName,
              state: data.stateName,
              city: data.cityName,
            );
          },
        ),
      );
    }
  }
}
