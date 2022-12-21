import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class rank extends StatefulWidget {
  const rank({super.key});

  @override
  State<rank> createState() => _rankState();
}

class _rankState extends State<rank> {
  final auth = FirebaseAuth.instance;

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
            "Bảng Xếp Hạng",
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
              .collection('account')
              .orderBy('diem', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;
              List<String> lshistory = [];
              List<int> lsdiem = [];
              for (var row in data) {
                final r = row.data() as Map<String, dynamic>;
                lshistory.add(r['ten']);
                lsdiem.add(r['diem']);
              }
              return ListView.builder(
                itemCount: lshistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(lshistory[index]),
                      trailing: Text('Điểm ' '${lsdiem[index].toString()}'),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('dadaw'),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
