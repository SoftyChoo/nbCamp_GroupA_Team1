import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class syPage extends StatefulWidget {
  syPage({super.key});

  @override
  State<syPage> createState() => _MsPageState();
}

class _MsPageState extends State<syPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Add Profile'),
      ),
      body: Form(
        key: this.formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next, // Keyboard Enter키 속성
                    decoration: InputDecoration(
                      label: Text('Name'),
                      hintText: 'Enter Your Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'check';
                      }
                    },
                  ),
                  TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text('Age'),
                      hintText: 'Enter Your Age',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Check';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text('MBTI'),
                      hintText: 'Enter Your MBTI',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Check';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text('Advantage'),
                      hintText: 'Enter Your Advantage',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Check';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      label: Text('Git/Blog'),
                      hintText: 'Enter Your Git/Blog',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Check';
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      label: Text('Collaboration Style'),
                      hintText: 'Enter Your Collaboration Style',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Check';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final formKeyState = formKey.currentState!;
                      if (formKeyState.validate()) {
                        formKeyState.save();
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
