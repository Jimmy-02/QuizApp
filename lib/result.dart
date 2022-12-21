import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/provider/constant.dart';
import 'package:flutter_application_1/provider/lichsu_provider.dart';
import 'package:date_format/date_format.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final String ten;
  final int kimcuong;
  final Function resetHandler;

  const Result(this.resultScore, this.ten, this.kimcuong, this.resetHandler,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final loginuser = auth.currentUser!.uid;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Kết Quả',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Điểm ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TextButton(
              //   onPressed: () {
              //     FirebaseFirestore.instance.collection("lichsu").add({
              //       "id": auth.currentUser!.uid,
              //       "ngaychoi": formatDate(DateTime.now(),
              //           [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]).toString(),
              //       "ten": ten,
              //       "diem": resultScore
              //     });
              //     resetHandler();
              //   },
              //   child: Container(
              //     color: Colors.green,
              //     padding: const EdgeInsets.all(14),
              //     child: const Text(
              //       'Chơi Lại',
              //       style: TextStyle(color: Colors.blue),
              //     ),
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection("lichsu").add({
                    "id": auth.currentUser!.uid,
                    "ngaychoi": formatDate(DateTime.now(),
                        [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]).toString(),
                    "ten": ten,
                    "diem": resultScore
                  });
                  FirebaseFirestore.instance
                      .collection("account")
                      .where("id", isEqualTo: auth.currentUser!.uid)
                      .get()
                      .then((value) => value.docs.forEach((element) {
                            element.reference.update({
                              'diem': resultScore,
                              'kimcuong': FieldValue.increment(resultScore),
                            });
                          }));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage()));
                  resetHandler();
                },
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    'Kết Thúc',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
