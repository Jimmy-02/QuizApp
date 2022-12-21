import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/obj/lichsu_obj.dart';

Future themlichsu(LichSuObject lichsuobj, String ten, int diem) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final lichsu = FirebaseFirestore.instance.collection('lichsu').doc();
  final themls = LichSuObject(
      id: lichsu.id, ten: ten, ngaychoi: DateTime.now().toString(), diem: diem);
  final json = lichsuobj.toJson();
  await lichsu.set(json);
}
