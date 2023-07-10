import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "name": "고양이",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://ifh.cc/g/gSmpQo.png'),
            Text("'A'bar"),
            Text("소개"),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 5,
                  ),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    var song = dataList[index];
                    String imgUrl = song['imgUrl']!;
                    String name = song['name']!;

                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width *
                                0.5 *
                                5 /
                                3 *
                                0.55,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            "https://i.ibb.co/KG9m5QS/applemusic.png",
                            width: 60,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
