import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(bartenderPage());
}

class bartenderPage extends StatefulWidget {
  const bartenderPage({Key? key}) : super(key: key);

  @override
  State<bartenderPage> createState() => _bartenderPage();
}

class _bartenderPage extends State<bartenderPage> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          textFocusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, // 현재 화면을 닫고 이전 화면으로 돌아감
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            stops: [0.8, 1.0], //하단 그라데이션범위지정
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.8, 1.0], //상단 그라데이션 범위지정
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Image.network(
                            'https://i.pinimg.com/564x/83/02/3a/83023a439b482e862d1c3e22c8bc7711.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ), //그라데이션 끝
                      Positioned(
                        //시작
                        top: 2.0,
                        left: 10.0,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WHO',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '                     MADE',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '                THIS',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'COCKTAIL?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 197, 32, 32)
                                        .withOpacity(0.5),
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ), //끝
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(20.0), // 원하는 margin 값을 설정합니다.
                          width: 100,
                          height: 150,
                          color: Colors.black,
                          child: Text(
                            '선택한 칵테일이미지 들어갈곳',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ) //칵테일이미지박스
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  color: Colors.black,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: SizedBox(
                          child: Text(
                            '- INTRODUCTION -',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'NAME : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // 이름 올라올 부분
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'MBTI : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // mbti 올라올 부분
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'AGE : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // age 올라올 부분
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'GITHUB : ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // github 올라올 부분
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'BLOG : ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // blog 올라올 부분
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4, //불필요한 stack위젯 삭제
                child: Container(
                  color: Colors.black, //별점 배경색변경
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              color: Colors.amber[500], // 선택된 별점 아이콘 색상
                            ),
                            unratedColor: Colors.grey, // 선택되지 않은 별점 아이콘 색상
                            onRatingUpdate: (newRating) {
                              setState(() {
                                rating = newRating; // rating 변수 업데이트
                              });
                              print(rating); // 업데이트된 별점 출력
                            },
                          ),
                          TextField(
                            style: TextStyle(
                                color: Colors.white), // 텍스트 필드 텍스트 색 변경
                            focusNode: textFocusNode, // FocusNode 할당
                            scrollPhysics:
                                NeverScrollableScrollPhysics(), //스크롤 불가
                            maxLines: 3, //n줄까지 화면에 보임
                            maxLength: 100, //글자수 제한
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(255, 46, 45, 45),
                              hintText: '평가를 남겨주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500), //색상변경 진주
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  CommentCompleted = true; // 작성 완료 상태 업데이트
                                },
                              );
                              textFocusNode.unfocus(); // 텍스트 필드에서 포커스 해제
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber), //확인버튼 색변경
                            child: Text(
                              'Check',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
