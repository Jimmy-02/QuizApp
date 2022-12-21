import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/obj/dangky_obj.dart';
import 'package:flutter_application_1/obj/dangkyuser_obj.dart';
import 'package:flutter_application_1/provider/dangky_provider.dart';
import 'package:email_validator/email_validator.dart';

class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return registerState();
  }
}

class registerState extends State<register> {
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtMatkhau = new TextEditingController();
  TextEditingController txtTenNguoiChoi = new TextEditingController();
  final _auth = FirebaseAuth.instance;
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
            "Đăng Ký",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
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
              padding: EdgeInsets.only(top: 250, left: 40, right: 40),
              child: TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    hintText: '*',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextField(
                controller: txtTenNguoiChoi,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Tên',
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextField(
                controller: txtMatkhau,
                obscureText: true,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(13),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Mật Khẩu',
                    hintText: '*',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 10, left: 40, right: 40),
            //   child: TextField(
            //     controller: txtSdt,
            //     keyboardType: TextInputType.phone,
            //     decoration: InputDecoration(
            //         isCollapsed: true,
            //         contentPadding: EdgeInsets.all(13),
            //         fillColor: Colors.white,
            //         filled: true,
            //         hintText: 'Số Điện Thoại',
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide.none,
            //             borderRadius: BorderRadius.circular(12))),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 40, right: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(185, 236, 171, 100),
                    foregroundColor: Color.fromRGBO(68, 58, 58, 100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minimumSize: Size(239, 50)),
                onPressed: () async {
                  if (!EmailValidator.validate(txtEmail.text)) {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    final snackBar =
                        SnackBar(content: Text('Sai định dạng email'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  if (txtMatkhau.text.isEmpty ||
                      txtEmail.text.isEmpty ||
                      txtTenNguoiChoi.text.isEmpty) {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    final snackBar = SnackBar(content: Text('Nhập Thiếu'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  if (txtMatkhau.text.length < 6) {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    final snackBar =
                        SnackBar(content: Text('Mật khẩu phải có 6 ký tự'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  final list = await FirebaseAuth.instance
                      .fetchSignInMethodsForEmail(txtEmail.text);
                  if (list.isNotEmpty) {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    final snackBar =
                        SnackBar(content: Text('Email đã tồn tại'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  final newUser = _auth
                      .createUserWithEmailAndPassword(
                          email: txtEmail.text, password: txtMatkhau.text)
                      .then((value) {
                    FirebaseFirestore.instance.collection("account").add({
                      "id": _auth.currentUser!.uid,
                      "email": txtEmail.text,
                      "ten": txtTenNguoiChoi.text,
                      "kimcuong": 0,
                      "diem": 0
                    });
                  });
                  if (newUser != null) {
                    // final User? user = _auth.currentUser;
                    // final nguoichoi = DangKyuserObject(
                    //   id: _auth.currentUser!.uid,
                    //   tennguoichoi: txtTenNguoiChoi.text,
                    //   email: txtEmail.text,
                    // );
                    // DangKy(nguoichoi);
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    Navigator.pop(context, 'Dang Ky Thanh Cong!');
                  } else {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');

                    final snackBar =
                        SnackBar(content: Text('Tai Khoan Nay Khong hop le'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
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
