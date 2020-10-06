import 'package:flutter/material.dart';
import 'package:metalapp/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashboardPage(
            currencyVal: 0.0,
            convertedCurrency: 0.0,
            currencyone: 'EUR',
            currencytwo: 'XAU',
            isWhite: false));
  }
}
