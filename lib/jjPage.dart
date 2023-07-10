import 'package:flutter/material.dart';

class jjPage extends StatefulWidget {
  const jjPage({super.key});

  @override
  State<jjPage> createState() => _MsPageState();
}

class _MsPageState extends State<jjPage> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("황진주"),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              'https://ifh.cc/g/cS1rMv.png',
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ), //이미지들어갈자리
          ),
          SizedBox(
            child: Text('이름'),
          )
        ],
      ),
    );
  }
}
