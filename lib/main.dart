import 'package:a_bar/addProfile.dart';
import 'package:a_bar/bartenderPage.dart';
import 'package:a_bar/bartender_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BartenderService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

// test
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "name": "Margarita",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails1.png",
        "bartender": "MinSu"
      },
      {
        "name": "Black\nRussian",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails2.png",
        "bartender": "Gyujin"
      },
      {
        "name": "Paloma  ",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails4.png",
        "bartender": "SoYeon"
      },
      {
        "name": "Martinez",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails3.png",
        "bartender": "JuHwan"
      },
      {
        "name": "Alexander",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails5.png",
        "bartender": "JinJu"
      },
      {
        "name": " Old\nfashioned",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails6.png",
        "bartender": ""
      },
      {
        "name": "Aviation",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails8.png",
        "bartender": ""
      },
      {
        "name": "Mojito",
        "imgUrl": "https://softychoo.github.io/assets/img/blog/cocktails7.png",
        "bartender": ""
      },
    ];

    // 화면에 보이는 영역
    return Consumer<BartenderService>(
        builder: (context, bartenderService, child) {
      List<Bartender> btList = bartenderService.btList;
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return RadialGradient(
                          center: Alignment.center,
                          radius: 1.0,
                          colors: [
                            Colors.yellow,
                            Colors.orange,
                          ], // Adjust the gradient colors as desired
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "'A' BAR",
                        style: TextStyle(
                          fontFamily: 'abar',
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "CockTails",
                      style: TextStyle(
                        fontFamily: "name",
                        fontSize: 30,
                        color: const Color.fromARGB(255, 208, 208, 208),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //가로로 두 개의 Gridview를 보여줌
                      childAspectRatio: 7 / 5, //gridView의 높이 조절
                    ),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      var blog = dataList[index];
                      String imgUrl = blog['imgUrl']!; // datalist의 url
                      String name = blog['name']!; //datalist의 name
                      String bt = blog['bartender']!;

                      return Container(
                        //margin: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     blurRadius: 3,
                          //     spreadRadius: 3,
                          //   ),
                          // ],
                        ),

                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  imgUrl,
                                  fit: BoxFit.fitHeight,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 120),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      //이름
                                      name,
                                      style: TextStyle(
                                        fontFamily: "name",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Bartender \n$bt",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "abar",
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Text(
                                        "10.00\$",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(height: 20)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "   Bartender",
                    style: TextStyle(
                        color: Color.fromARGB(255, 208, 208, 208),
                        fontFamily: "name",
                        fontSize: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                syPage()), // SecondPage는 이동할 대상 페이지의 클래스명
                      );
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Color.fromARGB(255, 208, 208, 208),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 208, 208, 208),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListView.builder(
                  itemCount: btList.length,
                  itemBuilder: (context, index) {
                    Bartender bartender = btList[index];
                    return ListTile(
                      title: Row(
                        children: [
                          Icon(
                            Icons.wine_bar_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            " Bartender : ",
                            style: TextStyle(fontFamily: "abar"),
                          ),
                          Text(
                            "Minsu",
                            style: TextStyle(fontFamily: "name"),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      bartenderPage()), // SecondPage는 이동할 대상 페이지의 클래스명
                            );
                          },
                          icon: Icon(Icons.arrow_circle_right)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
