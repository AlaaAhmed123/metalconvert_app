import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metalapp/currency_list.dart';
import 'package:metalapp/service.dart';
import 'package:metalapp/metal_list.dart';
import 'package:metalapp/red_input.dart';
import 'package:metalapp/white_input.dart';

class DashboardPage extends StatefulWidget {
  final currencyVal;
  final convertedCurrency;
  final currencyone;
  final currencytwo;
  final isWhite;

  DashboardPage(
      {this.currencyVal,
      this.convertedCurrency,
      this.currencyone,
      this.currencytwo,
      this.isWhite});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var value;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white),
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFEC5759)),
          Container(
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => CurrencyList(widget.currencyone,widget.currencytwo,0)));
                    },
                    child: Text(
                      CurrencyService().getCurrencyString(widget.currencyone),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: 'Quicksand'),
                    )),
                SizedBox(height: 20.0),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => InputRedPage(
                              origCurrency: widget.currencyone,
                              convCurrency: widget.currencytwo)));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 100.0,
                          fontFamily: 'Quicksand'),
                    )),
                Text(
                  widget.currencyone,
                  style: TextStyle(
                      color: Color(0xFFFFB6B6),
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 130.0),
                Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(62.5),
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xFFEC5759),
                          style: BorderStyle.solid,
                          width: 5.0)),
                  child: Center(
                    child: widget.isWhite
                        ? Icon(
                            Icons.arrow_upward,
                            size: 60.0,
                            color: Color(0xFFEC5759),
                          )
                        : Icon(
                            Icons.arrow_downward,
                            size: 60.0,
                            color: Color(0xFFEC5759),
                          ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  widget.currencytwo,
                  style: TextStyle(
                      color: Color(0xFFFFB6B6),
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => InputWhitePage(
                            origCurrency: widget.currencyone,
                            convCurrency: widget.currencytwo)));
                  },
                  child: Text(
                    widget.convertedCurrency.toString(),
                    style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 100.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => MetalList(widget.currencyone,widget.currencytwo,1)));
                  },
                  child: Text(
                  CurrencyService().getMetalString(widget.currencytwo),
                  style: TextStyle(
                      color: Color(0xFFEC5759),
                      fontSize: 22.0,
                      fontFamily: 'Quicksand'),
                ),),
              ],
            )),
          )
        ],
      ),
    );
  }

}
