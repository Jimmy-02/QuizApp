import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.dart';
import 'package:flutter_application_1/history.dart';
import 'package:flutter_application_1/linhvuc.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/provider/dangky_provider.dart';
import 'package:flutter_application_1/question.dart';
import 'package:flutter_application_1/rank.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _auth = FirebaseAuth.instance;
  var a;
  var b;
  void loadTenKC() async {
    FirebaseFirestore.instance
        .collection("account")
        .where("id", isEqualTo: _auth.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        setState(() {
          a = element['ten'];
          b = element['kimcuong'];
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTenKC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    'images/beluga.jpg',
                    fit: BoxFit.fill,
                  ),
                  // child: Image.network(
                  //   FirebaseAuth.instance.currentUser!.photoURL!,
                  //   fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '${a}',
                //'${widget.value}',
                //"${FirebaseAuth.instance.currentUser!.displayName}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.diamond_outlined,
                  color: Colors.blueAccent,
                ),
                Container(
                  child: Text(
                    '${b}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(160, 235, 168, 100),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => linhvuc()));
                },
                child: const Text(
                  'Trò Chơi Mới',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
                      MaterialPageRoute(builder: (context) => account()));
                },
                child: const Text(
                  'Tài Khoản',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
                      MaterialPageRoute(builder: (context) => history()));
                },
                child: const Text(
                  'Lịch Sử Chơi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => rank()));
                },
                child: const Text(
                  'Bảng Xếp Hạng',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(156, 76, 150, 29),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
                child: const Text(
                  'Đăng Xuất',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
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
