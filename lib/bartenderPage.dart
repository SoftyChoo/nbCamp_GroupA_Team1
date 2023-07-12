import 'package:a_bar/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class bartenderPage extends StatefulWidget {
  bartenderPage({super.key});

  @override
  State<bartenderPage> createState() => _MsPageState();
}

class _MsPageState extends State<bartenderPage> {
  TextEditingController contentController = TextEditingController();
  double rating = 0; // 초기 별점 값 설정
  bool CommentCompleted = false; //작성 완료 상태 여부
  final FocusNode textFocusNode = FocusNode(); // FocusNode 생성

  @override
  void dispose() {
    textFocusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 다른 화면 터치 시 텍스트 필드에서 포커스 해제
        textFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                RatingBar.builder(
                  initialRating: rating, // rating 변수를 초기 별점 값으로 설정
                  minRating: 0, //평점 최소 단위. 0점부터 시작
                  direction: Axis.horizontal,
                  allowHalfRating: true, //별점 반값 가능 허용여부
                  itemCount: 5, //평점 갯수 조절
                  itemSize: 30.0, // 아이콘 크기 조절
                  itemBuilder: (context, _) => Icon(
                    Icons.wine_bar,
                    color: Colors.amber[500],
                  ),
                  onRatingUpdate: (newRating) {
                    setState(() {
                      rating = newRating; // rating 변수 업데이트
                    });
                    print(rating); // 업데이트된 별점 출력
                  },
                ),
                TextField(
                  focusNode: textFocusNode, // FocusNode 할당
                  scrollPhysics: NeverScrollableScrollPhysics(), //스크롤 불가
                  maxLines: 5, //n줄까지 화면에 보임
                  maxLength: 200, //글자수 제한
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      int newLines = newValue.text.split('\n').length;
                      if (newLines > 5) {
                        return oldValue;
                      } else {
                        return newValue;
                      }
                    })
                  ], // Textinputformatter를 사용하여 라인 수를 체크함.
                  // newLines > x에서 x부터의 줄을 넘길 수 없음
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                    hintText: '평가를 남겨주세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown[600],
                  ),
                  onPressed: () {
                    setState(() {
                      CommentCompleted = true; // 작성 완료 상태 업데이트
                    });
                    textFocusNode.unfocus(); // 텍스트 필드에서 포커스 해제
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('작성을 완료하셨습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () {
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
                      },
                    );
                  },
                  child: Text('확인'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
