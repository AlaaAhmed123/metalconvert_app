import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metalapp/dashboard.dart';

class MetalList extends StatefulWidget {
  final currencyone;
  final currencytwo;
  final check;
  MetalList( this.currencyone,
      this.currencytwo,this.check);

  @override
  _MetalListState createState() => _MetalListState();
}

class _MetalListState extends State<MetalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEC5759),
        appBar: AppBar(
          backgroundColor: Color(0xFFEC5759),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            getListItem('Gold ', 'XAU'),
            getListItem('Silver', 'XAG'),
            getListItem(' Platinum', 'XPT'),
            getListItem('Palladium', 'XPD'),
            getListItem('Rhodium', 'XRH'),
            getListItem(' Ruthenium', 'RUTH'),
            getListItem(' United Arab Emirates Dirham', 'AED'),
            getListItem(' Ruthenium', 'RUTH'),
          ],
        ));
  }

  Widget getListItem(String currencyName, String currency) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (context) => DashboardPage(
                currencyVal: 0.0,
                isWhite: false,
                convertedCurrency: 0.0,
                currencyone: widget.check==0?currency:widget.currencyone,
                currencytwo: widget.check==1?currency:widget.currencytwo)));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 20.0),
        child: Text(
          currencyName,
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
