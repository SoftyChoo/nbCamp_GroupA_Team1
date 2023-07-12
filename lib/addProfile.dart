import 'package:a_bar/bartender_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class syPage extends StatefulWidget {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController MBTIController = TextEditingController();
  final TextEditingController ADController = TextEditingController();
  final TextEditingController BlogController = TextEditingController();
  final TextEditingController Controller = TextEditingController();
  final TextEditingController StyleController = TextEditingController();

  syPage({Key? key, required this.index}) : super(key: key); // 수정된 부분
  final int index;

  @override
  State<syPage> createState() => _MsPageState();
}

class _MsPageState extends State<syPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    BartenderService bartenderService = context.read<BartenderService>();
    Bartender bartenderProfile = bartenderService.btList[index];
    widget.NameController.text = bartenderProfile.btName;
    widget.AgeController.text = bartenderProfile.btAge;
    widget.MBTIController.text = bartenderProfile.btMbti;
    widget.ADController.text = bartenderProfile.btAdvantage;
    widget.BlogController.text = bartenderProfile.btBlog;
    widget.StyleController.text = bartenderProfile.btStyle;
    final FocusNode textFocusNode = FocusNode(); // FocusNode 생성
    @override
    void dispose() {
      textFocusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode 해제
      super.dispose();
    }

    return GestureDetector(
      onTap: () {
        textFocusNode.unfocus();
      },
      child: Scaffold(
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
                      controller: widget.NameController,
                      keyboardType: TextInputType.name,
                      textInputAction:
                          TextInputAction.next, // Keyboard Enter키 속성
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
                      controller: widget.AgeController,
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
                      controller: widget.MBTIController,
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
                      controller: widget.ADController,
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
                      controller: widget.BlogController,
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
                      controller: widget.StyleController,
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
                        } else {
                          AlertDialog(
                            content: Text('작성을 완료하셨습니까?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  bartenderService.updateItem(
                                      index: index,
                                      btName: widget.NameController.text,
                                      btMbti: widget.MBTIController.text,
                                      btAge: widget.AgeController.text,
                                      btAdvantage: widget.ADController.text,
                                      btBlog: widget.BlogController.text,
                                      btStyle: widget.StyleController.text);
                                  Navigator.of(context).pop(); // 대화 상자 닫기
                                },
                                child: Text(
                                  '확인',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // 대화 상자 닫기
                                },
                                child: Text(
                                  '취소',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
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
      ),
    );
  }
}
