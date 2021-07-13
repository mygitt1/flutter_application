import 'package:flutter/material.dart';
import 'package:flutter_application/provider/prefrences.dart';

class ScreenTwo extends StatefulWidget {
  static const routeName = '/screen-two';
  final String country;
  final String state;
  final String city;

  ScreenTwo({
    this.country,
    this.state,
    this.city,
  });

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final Prefrences prefrences = Prefrences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen Two'),
        backgroundColor: Colors.brown.shade900,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 20, left: 10, right: 10),
              child: SearchBox(),
            ),
            Expanded(
              child: FutureBuilder(
                future: prefrences.getData(),
                builder: (ctx, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Map<String, dynamic> mapOfData = snapshot.data;

                    return ListView(
                        children: mapOfData.values.toList().map<Widget>((e) {
                      return Container(
                        height: 160,
                        child: Card(
                          elevation: 6,
                          margin: EdgeInsets.all(10),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Country : ${e['country'] ?? ' '}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Divider(),
                                    Text(
                                      'State : ${e['state'] ?? ' '}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    Divider(),
                                    Text(
                                      'City : ${e['city'] ?? ' '}',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(color: Colors.brown.shade900),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.brown.shade900,
          ),
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 2,
              color: Colors.brown.shade900,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade900),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
