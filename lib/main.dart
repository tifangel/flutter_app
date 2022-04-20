import 'package:flutter/material.dart';
import 'package:myflutterapp/providers/cart_operations.dart';
import 'package:myflutterapp/theme.dart';
import 'package:provider/provider.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
  //Kalau mau banyak provider
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => CartOperation()),
  //       Provider(create: (context) => SomeOtherClass()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<CartOperation>(
    //   create: (context) => CartOperation(),
    //   child: MaterialApp(
    //     title: 'Food App',
    //     theme: buildThemeData(),
    //     home: const MainScreen(),
    //   ),
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartOperation()),
        ],
        builder: (context, child) {
          var u = Provider.of<CartOperation>(context);

          return MaterialApp(
              title: 'Food App',
              theme: buildThemeData(),
              home: const MainScreen(),
              debugShowCheckedModeBanner: false);
        });
  }
}
