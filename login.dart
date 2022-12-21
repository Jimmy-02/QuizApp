import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_application_1/forgetpass.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/provider/google_signin.dart';
import 'package:flutter_application_1/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginState();
  }
}

class loginState extends State<login> {
  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtTaiKhoan = new TextEditingController();

  TextEditingController txtMatKhau = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                'KTK QUIZZ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70, left: 40, right: 40),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextField(
                controller: txtMatKhau,
                obscureText: true,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Mật Khẩu',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(156, 193, 241, 115),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () async {
                  // String tentaikhoan = txtTaiKhoan.text.trim();
                  // String matkhau = txtMatKhau.text.trim();
                  // QuerySnapshot snap = await FirebaseFirestore.instance
                  //     .collection("account")
                  //     .where('ten', isEqualTo: tentaikhoan)
                  //     .get();
                  // if (txtTaiKhoan.text == '' || txtMatKhau.text == '') {
                  //   var snackBar = SnackBar(
                  //     content: Text('Sai tài khoản hoặc mật khẩu'),
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //   return;
                  // }
                  // if (matkhau == snap.docs[0]['matkhau']) {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => homepage(
                  //                 value: txtTaiKhoan.text,
                  //               )));
                  // }
                  if (txtEmail.text.isEmpty || txtMatKhau.text.isEmpty) {
                    final snackBar = SnackBar(
                        content: Text('Email hoac Mat khau khong dung'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  final _user = _auth.signInWithEmailAndPassword(
                      email: txtEmail.text, password: txtMatKhau.text);

                  _auth.authStateChanges().listen((event) async {
                    if (event == null) {
                      final snackBar = SnackBar(
                          content: Text('Email hoac Mat khau khong dung'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }
                    if (event != null) {
                      txtEmail.clear();
                      txtMatKhau.clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homepage()));
                    }
                  });
                },
                child: const Text(
                  'Đăng Nhập',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(184, 232, 154, 100),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => forgetpass()));
                },
                child: const Text(
                  'Quên Mật Khẩu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(185, 236, 171, 100),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()))
                      .then((value) {
                    if (value != null) {
                      final snackBar = SnackBar(content: Text(value));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                child: const Text(
                  'Đăng Ký',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
