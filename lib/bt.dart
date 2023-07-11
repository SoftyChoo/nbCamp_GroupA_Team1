import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [Image.network('https://ifh.cc/g/XHj5VA.jpg')],
            )
          ],
        ),
      ),
    );
  }
}
