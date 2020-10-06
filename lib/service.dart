import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:metalapp/dashboard.dart';

class CurrencyService {
  getCurrencyString(currency) {
    if (currency == 'USD') return 'United States Dollar';
    if (currency == 'EUR') return 'EURO';
    if (currency == 'RUB') return 'Russian Ruble';
    if (currency == 'JPY') return 'Japanese Yen';
    if (currency == 'INR') return 'Indian Rupee';
    if (currency == 'GBP') return 'Pound Sterling';
    if (currency == 'DZD') return 'Algerian Dinar';
    if (currency == 'ARS') return 'Argentine Peso';
    if (currency == 'AUD') return 'Australian Dollar';
    if (currency == 'COP') return 'Colombian Peso';
    if (currency == 'QAR') return 'Qatari Rials';
    if (currency == 'SAR') return 'Saudi Arabian Riyal';
    if (currency == 'EGP') return 'Egyptian Pounds';
    if (currency == 'INR') return 'Indian Rupee';
    if (currency == 'IDR') return 'Indonesian Rupiah';
    if (currency == 'BRL') return 'Brazilian Real';
    if (currency == 'CAD') return 'Canadian Dollar';
    if (currency == 'CLP') return 'Chilean Peso';
    if (currency == 'BDT') return 'Bangladeshi Taka';
    if (currency == 'VND') return 'Vietnamese Don';
    if (currency == 'VEF') return ' Venezuelan Bolivar';


  }
  getMetalString(metal) {
    if (metal == 'XAU') return 'Gold  ';
    if (metal == 'XAG') return 'Silver';
    if (metal == 'XPT') return ' Platinum';
    if (metal == 'XPD') return ' Palladium';
    if (metal == 'XRH') return 'Rhodium ';
    if (metal == 'RUTH') return ' Ruthenium';
  }
  var value;

  convertCurrency(int check,String fromCurrency, String toCurrency, int amount, context)async {
    var url="https://metals-api.com/api/latest?access_key=qcnpmhya69ie464afh3i9lf846m4p88fpr8n5x048akp4lu8xx7r3754u87l&base=$fromCurrency&symbols=$toCurrency";
    http.Response response=await http.get(url);
    var body=json.decode(response.body);
    if(fromCurrency=="USD")
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                DashboardPage(
                    currencyVal: check == 0 ? amount :
                        (amount * body["rates"][toCurrency]).toStringAsFixed(5),
                    convertedCurrency: check == 0 ? (1/(amount *
                        body["rates"][toCurrency])).toStringAsFixed(2) : amount,
                    currencyone: fromCurrency,
                    currencytwo: toCurrency,
                    isWhite: false)));
      }else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              DashboardPage(
                  currencyVal: check == 0 ? amount : (1 /
                      (amount * body["rates"][toCurrency])).toStringAsFixed(5),
                  convertedCurrency: check == 0 ? (amount *
                      body["rates"][toCurrency]).toStringAsFixed(2) : amount,
                  currencyone: fromCurrency,
                  currencytwo: toCurrency,
                  isWhite: false)));
    }
      print((amount * body["rates"][toCurrency]).toDouble());

  }
}
