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
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Image.network(
                    'https://ifh.cc/g/XHj5VA.jpg',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Container(
                      width: 100,
                      height: 200,
                      color: Colors.black,
                    ),
                  ), //칵테일이미지넣는박스
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.black,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Text(
                          'name',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Other Widgets',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    // Add more widgets here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
