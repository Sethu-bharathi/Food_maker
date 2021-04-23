import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  Signupscreen({Key key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}



class _SignupscreenState extends State<Signupscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
