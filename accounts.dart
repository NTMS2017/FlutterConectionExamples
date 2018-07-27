
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



final Color darkMainGreen = const Color(0xFF689F38);
final Color midMainGreen = const Color(0xFF7CB342);
final Color lightMainGreen = const Color(0xFF8BC34A);

// Statefull HomePage
class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => new _AccountsPageState();
}

// TODO: ACCOUNTS PAAGE STATE HEADER Class *************************************
class _AccountsPageState extends State<AccountsPage> {
  bool hasData = false;
  String errorText;

  @override
  void initState() {
    _getAccountsFromServer();
    super.initState();
  }

  // TODO: _getAccountsFromServer ***************************************
  Future _getAccountsFromServer() async {
    try {

      final result = await InternetAddress.lookup('<IP Address in Here>');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var response = await http.get(Uri.encodeFull("<Rest Api in Here>"),
            headers: {'Accept': 'application/json'});

        if (response.statusCode == 200) {
            setState(() {
              hasData = true;
              errorText = "";
            });
        } else {
          // TODO: if else response.statusCode
          setState(() {
            hasData = false;
            errorText = "very bad error";
          });
        }
      } else {
        // TODO: if else result.isNotEmpty
        setState(() {
          hasData = false;
          errorText = "very bad error";
        });
      }
    } on Exception {
      hasData = false;
      errorText = "very bad error";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasData == false) {
      if (errorText != "") {
        return new Scaffold(
          // BODY
            body: new Center(
              child: new Text("SHOW NICE ERROR IN HERE"),
            )
        );
      } else {
        return new Scaffold(
          body: new Center(
            child: new CircularProgressIndicator(),
          ),
        );
      }
    } else {
      return new Scaffold(
        // BODY
          body: new Center(
            child: new Text("My Accounts"),
          )
      );
    }
  }


