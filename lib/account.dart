import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/homepage.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  TextEditingController txtTen = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  var a;
  var b;
  void loadAccount() async {
    FirebaseFirestore.instance
        .collection("account")
        .where("id", isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        a = element['ten'];
        b = element['email'];
      });
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Tài Khoản",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextField(
                controller: txtTen,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '${a}',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '${b}',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(185, 236, 171, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  final user =
                      FirebaseFirestore.instance.collection('account').doc();
                  final update = FirebaseFirestore.instance
                      .collection('account')
                      .doc(user.id)
                      .update({'name': txtTen.text});
                },
                child: Text(
                  "Cập Nhật",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
