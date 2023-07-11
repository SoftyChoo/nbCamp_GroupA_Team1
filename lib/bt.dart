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
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.black,
                child: ListView(
                  children: [
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
