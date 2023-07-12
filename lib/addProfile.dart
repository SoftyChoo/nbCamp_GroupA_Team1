import 'package:a_bar/bartender_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class syPage extends StatelessWidget {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController MBTIController = TextEditingController();
  final TextEditingController ADController = TextEditingController();
  final TextEditingController BlogController = TextEditingController();
  final TextEditingController Controller = TextEditingController();
  final TextEditingController StyleController = TextEditingController();

  syPage({Key? key, required this.index}); // : super(key: key); // 수정된 부분
  final int index;

  @override
  Widget build(BuildContext context) {
    BartenderService bartenderService = context.read<BartenderService>();
    Bartender bartenderProfile = bartenderService.btList[index];
    NameController.text = bartenderProfile.btName;
    AgeController.text = bartenderProfile.btAge;
    MBTIController.text = bartenderProfile.btMbti;
    ADController.text = bartenderProfile.btAdvantage;
    BlogController.text = bartenderProfile.btBlog;
    StyleController.text = bartenderProfile.btStyle;
    final FocusNode textFocusNode = FocusNode(); // FocusNode 생성
    // @override
    // void dispose() {
    //   textFocusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode 해제
    //   super.dispose();
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Add Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: NameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next, // Keyboard Enter키 속성
                  decoration: InputDecoration(
                    label: Text('Name'),
                    hintText: 'Enter Your Name',
                  ),
                ),
                TextField(
                  controller: AgeController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('Age'),
                    hintText: 'Enter Your Age',
                  ),
                ),
                TextField(
                  controller: MBTIController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('MBTI'),
                    hintText: 'Enter Your MBTI',
                  ),
                ),
                TextField(
                  controller: ADController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('Advantage'),
                    hintText: 'Enter Your Advantage',
                  ),
                ),
                TextField(
                  controller: BlogController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('Git/Blog'),
                    hintText: 'Enter Your Git/Blog',
                  ),
                ),
                TextField(
                  controller: StyleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    label: Text('Collaboration Style'),
                    hintText: 'Enter Your Collaboration Style',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //final formKeyState = formKey.currentState!;
                    if (NameController.text.isEmpty ||
                        AgeController.text.isEmpty ||
                        MBTIController.text.isEmpty ||
                        ADController.text.isEmpty ||
                        BlogController.text.isEmpty ||
                        StyleController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('빈칸이 존재합니다!'),
                            content: Text('빈칸을 채워주세요!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      bartenderService.updateItem(
                          index: index,
                          btName: NameController.text,
                          btMbti: MBTIController.text,
                          btAge: AgeController.text,
                          btAdvantage: ADController.text,
                          btBlog: BlogController.text,
                          btStyle: StyleController.text);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
