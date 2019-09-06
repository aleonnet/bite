import 'package:flutter/material.dart';

class LoginDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get started with bite',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              InkWell(
                splashColor: Colors.blue,
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                  autocorrect: false,
                ),
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
