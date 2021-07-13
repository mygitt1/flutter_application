import 'package:flutter/material.dart';
import 'package:flutter_application/pages/screen_two.dart';
import 'package:flutter_application/provider/provider_data.dart';
import 'package:provider/provider.dart';
import 'pages/screen_one.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
          create: (_) => DataProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ScreenOne.routeName,
        routes: {
          ScreenOne.routeName: (ctx) => ScreenOne(),
          ScreenTwo.routeName: (ctx) => ScreenTwo(),
        },
      ),
    );
  }
}
