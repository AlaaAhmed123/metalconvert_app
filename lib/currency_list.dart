import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metalapp/dashboard.dart';

class CurrencyList extends StatefulWidget {
  final currencyone;
  final currencytwo;
  final check;
  CurrencyList( this.currencyone,
      this.currencytwo,this.check);
  
  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
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
            getListItem('EURO ', 'EUR'),
            getListItem('United States Dollar', 'USD'),
            getListItem('Russian Ruble', 'RUB'),
            getListItem('Indian Rupee', 'INR'),
            getListItem('Japanese Yen', 'JPY'),
            getListItem('Pound Sterling', 'GBP'),
            getListItem('Algerian Dinar','DZD'),
            getListItem('Argentine Peso','ARS'),
            getListItem('Australian Dollar', 'AUD'),
            getListItem('Colombian Peso','COP'),
            getListItem('Qatari Rials', 'QAR'),
            getListItem('Saudi Arabian Riyal', 'SAR'),
            getListItem('Egyptian Pounds', 'EGP'),
            getListItem('Indian Rupee', 'INR'),
            getListItem('Indonesian Rupiah', 'IDR'),
            getListItem('Brazilian Real', 'BRL'),
            getListItem('Canadian Dollar', 'CAD'),
            getListItem('Bangladeshi Taka','BDT'),
            getListItem('Vietnamese Don','VND'),
            getListItem(' Venezuelan Bolivar', 'VEF'),
            getListItem(' Chilean Peso', 'CLP'),







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
