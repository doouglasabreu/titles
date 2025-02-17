import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/product': (context) => ProductPage(),

      // },
      // home: const HomePage(),
    );
  }
}
