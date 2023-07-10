import 'package:flutter/material.dart';

class MsPage extends StatefulWidget {
  const MsPage({super.key});

  @override
  State<MsPage> createState() => _MsPageState();
}

class _MsPageState extends State<MsPage> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MsPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: contentController,
          decoration: InputDecoration(
            hintText: "개인페이지 완성해주세요",
            border: InputBorder.none,
          ),
          autofocus: true,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            // 텍스트필드 안의 값이 변할 때
          },
        ),
      ),
    );
  }
}
