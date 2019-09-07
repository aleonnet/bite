import 'package:bite/theme/style.dart';
import 'package:flutter/material.dart';

class LoginDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme().accentColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your phone number',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              TextFormField(
                autofocus: true,
                cursorColor: appTheme().cursorColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
                autocorrect: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
