import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Addmenu extends StatefulWidget {
  static final id = "addmenu";
  @override
  _AddmenuState createState() => _AddmenuState();
}

class _AddmenuState extends State<Addmenu> {
 String foodname, duration;
  int price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80"),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topRight,
                          colors: [
                            Colors.black.withOpacity(.7),
                            Colors.black.withOpacity(.2)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.1),
                        ]),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.menu_book_outlined),
                              Text("  New Item", style: Ktextstyle),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        addMenu("Foodname", Icons.food_bank_rounded,(value){
                          foodname=value;
                        }),
                        addMenu( "Time taken", Icons.timer,(value){
                          duration=value;
                        }),
                        addMenu("Cost", Icons.monetization_on,(value){
                          price=value;
                        }),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.black.withOpacity(.6),
                          ),
                          child: MaterialButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.pink,
                              )),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.pink.withOpacity(.7),
                          ),
                          child: MaterialButton(
                              onPressed: () async{
                               await add_menu(foodname, duration, price);
                              },
                              child: Text(
                                "Add",
                                style: Ktextstyle,
                              ),),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget addMenu(String text, IconData icon,Function function) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10, right: 20),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.pink,
          ),
          hintText: text,
        ),
        onChanged: function,
      ),
    ),
  );
}

Future<void> add_menu(String foodname, String duration, int price) async {
  final _firestore = FirebaseFirestore.instance;
  await _firestore
      .collection("Food maker")
      .doc(FirebaseAuth.instance.currentUser.uid)
      .collection("menus")
      .add({"id":1,"name":foodname,"duration":duration,"price":price,"rating":5,"file":""});
}
