import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/obj/dangky_obj.dart';
import 'package:flutter_application_1/obj/dangkyuser_obj.dart';

Future DangKy(DangKyuserObject User) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final docAccount = FirebaseFirestore.instance.collection('account').doc();
  final docUser = FirebaseFirestore.instance.collection('account').doc();

  // User.id = docUser.id;

  // final jsonAccount = Account.toJson();
  // await docUser.set(jsonAccount);

  final jsonUser = User.toJson();
  await docUser.set(jsonUser);
}
