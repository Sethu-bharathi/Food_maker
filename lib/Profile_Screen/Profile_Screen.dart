import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "package:notes_app/constants.dart";

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var text = "hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80"),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.2)
                      ])),
              child: Stack(
                children: [
                  Positioned(
                    left: 20.0,
                    top: 20,
                    child: Text(
                      "Chola Hotel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        backgroundColor: Colors.black.withOpacity(.3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      child: Row(children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          "  4/8,peelamedu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.black.withOpacity(.2),
            ),
            child: GestureDetector(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "     Menu",
                      style: Ktextstyle,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    )
                  ]),
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
            child: Text(
          "Your rating",
          style: Ktextstyle,
        )),
        SizedBox(height: 10),
        CircularPercentIndicator(
          radius: 100.0,
          lineWidth: 10.0,
          percent: .90,
          center: new Text(
            "4.5",
            style: Ktextstyle,
          ),
          progressColor: Colors.green,
        )
      ]),
    );
  }
}


