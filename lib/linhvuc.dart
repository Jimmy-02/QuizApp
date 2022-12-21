import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/question.dart';

class linhvuc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _linhvucState();
  }
}

class _linhvucState extends State<linhvuc> {
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Chọn Lĩnh Vực",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Container(
            //   padding: const EdgeInsets.only(top: 100),
            //   child: Text(
            //     'Chọn Lĩnh Vực',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       fontSize: 35,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(top: 200, left: 60, right: 60),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  final questions1 = [
                    {
                      'questionText':
                          'Nhiệm vụ chung của cách mạng Việt Nam giai đoạn 1954 - 1975 là',
                      'answers': [
                        {
                          'text':
                              'Xây dựng chủ nghĩa xã hội ở miền Bắc và kháng chiến chống Mĩ ở miền Nam K',
                          'score': -2
                        },
                        {'text': 'Xây dựng chủ nghĩa xã hội', 'score': -2},
                        {'text': 'háng chiến chống Mĩ cứu nước', 'score': 10},
                        {
                          'text':
                              'Hoàn thành cách mạng dân tộc dân chủ nhân dân ở miền Nam',
                          'score': -2
                        },
                      ],
                    },
                    {
                      'questionText':
                          'Cuộc khai thác thuộc địa lần thứ hai (1919-1929) của thực dân Pháp ở Đông Dương đã có tác động như thế nào đến phong trào yêu nước Việt Nam?',
                      'answers': [
                        {
                          'text':
                              'Du nhập những luồng tư tưởng mới vào Việt Nam ',
                          'score': -2
                        },
                        {
                          'text': 'Làm xuất hiện những giai cấp mới ở Việt Nam',
                          'score': -2
                        },
                        {
                          'text':
                              'Thúc đẩy sự phát triển của nền kinh tế và nhu cầu độc lập ',
                          'score': -2
                        },
                        {
                          'text':
                              'Làm cho phong trào yêu nước mang màu sắc mới',
                          'score': 10
                        },
                      ],
                    },
                    {
                      'questionText':
                          'Nhiệm vụ chiến lược của cách mạng Việt Nam giai đoạn 1945-1954 là',
                      'answers': [
                        {'text': 'Kháng chiến chống Pháp', 'score': -2},
                        {'text': 'Kháng chiến - kiến quốc ', 'score': 10},
                        {
                          'text': 'Xây dựng chế độ mới ở Việt Nam ',
                          'score': -2
                        },
                        {
                          'text': 'Bảo vệ thành quả cách mạng tháng Tám',
                          'score': -2
                        },
                      ],
                    },
                    {
                      'questionText':
                          'Đâu là nhiệm vụ hàng đầu của cách mạng Việt Nam giai đoạn 1930-1945?',
                      'answers': [
                        {'text': 'Giải phóng dân tộc ', 'score': 10},
                        {'text': 'Thổ địa cách mạng', 'score': -2},
                        {
                          'text':
                              'Giành độc lập dân tộc và ruộng đất cho dân cày ',
                          'score': -2
                        },
                        {
                          'text': 'Tiến hành cách mạng dân tộc dân chủ',
                          'score': -2
                        },
                      ],
                    },
                    {
                      'questionText':
                          'Chiến thắng nào trong thời kì 1954 - 1975 đánh dấu bước phát triển từ đấu tranh chính trị phát triển lên khởi nghĩa?',
                      'answers': [
                        {
                          'text':
                              'Đánh thắng chiến lược “Chiến tranh cục bộ” (1965 – 1968)',
                          'score': -2,
                        },
                        {
                          'text': 'Phong trào “Đồng khởi” 1959-1960. ',
                          'score': 10
                        },
                        {
                          'text':
                              'Đánh thắng chiến lược “Việt Nam hóa chiến tranh” (1969 - 1973)',
                          'score': -2
                        },
                        {
                          'text':
                              'Đánh thắng chiến lược “Chiến tranh đặc biệt” (1961 - 1965)',
                          'score': -2
                        },
                      ]
                    },
                    {
                      'questionText':
                          'Chiến thắng nào trong thời kì 1954 - 1975 đánh dấu bước phát triển từ đấu tranh chính trị phát triển lên khởi nghĩa?',
                      'answers': [
                        {
                          'text':
                              'Đánh thắng chiến lược “Chiến tranh cục bộ” (1965 – 1968)',
                          'score': -2,
                        },
                        {
                          'text': 'Phong trào “Đồng khởi” 1959-1960. ',
                          'score': 10
                        },
                        {
                          'text':
                              'Đánh thắng chiến lược “Việt Nam hóa chiến tranh” (1969 - 1973)',
                          'score': -2
                        },
                        {
                          'text':
                              'Đánh thắng chiến lược “Chiến tranh đặc biệt” (1961 - 1965)',
                          'score': -2
                        },
                      ]
                    },
                  ]..shuffle(Random.secure());
                  //  var randomQuestions1 = (questions1..shuffle()).sublist(0, 5);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => question(
                                questions: questions1,
                              )));
                },
                child: const Text(
                  'Lịch Sử',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 60, right: 60),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(239, 50)),
                onPressed: () {
                  final questions2 = [
                    {
                      'questionText': 'Who created dawdawawd?',
                      'answers': [
                        {'text': 'Facebook', 'score': -2},
                        {'text': 'Adobe', 'score': -2},
                        {'text': 'Google', 'score': 10},
                        {'text': 'Microsoft', 'score': -2},
                      ],
                    },
                  ];
                  var randomQuestions2 = (questions2..shuffle()).sublist(0, 5);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => question(
                                questions: questions2,
                              )));
                },
                child: const Text(
                  'Địa Lý',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 60, right: 60),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(239, 50)),
                onPressed: () {},
                child: const Text(
                  'Thể Thao',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
