import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Container(
        child: Column(children: <Widget>[
          Positioned(child: Container(child: Center(child: Text("Login", style: TextStyle(color: Colors.white30, fontSize: 40, fontWeight: FontWeight.bold)))))
        ]),
      ),
    );
  }
}
