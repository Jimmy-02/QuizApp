import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/question.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final loginuser = auth.currentUser;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Lịch Sử Chơi",
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('lichsu')
              .where('id', isEqualTo: auth.currentUser!.uid)
              .orderBy('ngaychoi', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;
              List<String> lshistory = [];
              List<int> lsdiem = [];
              List<String> lsngaychoi = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lshistory.add(r['ten']);
                lsdiem.add(r['diem']);
                lsngaychoi.add(r['ngaychoi']);
              }

              return ListView.builder(
                itemCount: lshistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(lshistory[index]),
                      trailing: Text('Điểm ' '${lsdiem[index].toString()}'),
                      subtitle: Text('${lsngaychoi[index]}'),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('có lỗi xảy ra'),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
