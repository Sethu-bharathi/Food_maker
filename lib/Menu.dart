import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Addmenu.dart';
import "package:notes_app/constants.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var val=true;
    final height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Food maker")
              .doc(_auth.currentUser.uid)
              .collection("menus")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var menus = snapshot.data.docs;
              List<Widget> menulist = [];
              for (var i in menus) {
                menulist.add(Food_menu(
                  Foodname: i.data()["name"],
                  Price: i.data()["price"],
                  Duration: i.data()["duration"],
                  photo: i.data()["file"],
                  height: height,
                  width: width,
                  isAvailable: i.data()["available"],
                ));
              }
              menulist.add(FloatingActionButton(
                onPressed: (){
                  Navigator.popAndPushNamed(context, Addmenu.id);
                },
                child: Icon(Icons.add),
              ));
              return ListView(
                children: menulist,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class Food_menu extends StatefulWidget {
  var Foodname;
  var Price, width, height;
  var Duration;
  var photo;
  bool isAvailable;
  Food_menu(
      {this.Foodname,
      this.Price,
      this.Duration,
      this.isAvailable,
      this.photo,
      this.width,
      this.height});
  @override
  _Food_menuState createState() => _Food_menuState();
}

class _Food_menuState extends State<Food_menu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isAvailble = this.widget.isAvailable;
    bool a=false;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.pink.withOpacity(.8),
                Colors.pink.withOpacity(.4)
              ]),
          borderRadius: BorderRadius.circular(17),
        ),
        height: this.widget.height / 4.5,
        width: this.widget.width,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 50,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(this.widget.photo))),
                child: CircleAvatar(
                  radius: 30,
                  child: null,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              top: 25,
              right: 100,
              child: Text(
                this.widget.Foodname,
                style: Ktextstyle.copyWith(fontSize: 23),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Checkbox(
                value:a,
                onChanged: (value){
                  setState(() {
                    a=value;
                  print(value);
                  });
              },)
            ),
            Positioned(
              left: 15,
              bottom: 10,
              child: Row(
                children: [
                  Icon(Icons.timer),
                  Text("  " + this.widget.Duration, style: Ktextstyle)
                ],
              ),
            ),
            Positioned(
                right: 15,
                bottom: 10,
                child: Text("₹ " + this.widget.Price, style: Ktextstyle)),
                
          ],
        ),

      ),
    );
  }
}
