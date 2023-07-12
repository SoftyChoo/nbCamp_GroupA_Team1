import 'package:flutter/material.dart';

import 'main.dart';

class Bartender {
  Bartender({
    required this.btName,
    required this.btMbti,
    required this.btAge,
    required this.btAdvantage,
    required this.btBlog,
    required this.btStyle,
  });
  String btName;
  String btMbti;
  String btAge;
  String btAdvantage;
  String btBlog;
  String btStyle;
}

class BartenderService extends ChangeNotifier {
  List<Bartender> btList = [];

  createItem(
      {required String btName,
      required String btMbti,
      required String btAge,
      required String btAdvantage,
      required String btBlog,
      required String btStyle}) {
    btList.add(
      Bartender(
        btName: btName,
        btMbti: btMbti,
        btAge: btAge,
        btAdvantage: btAdvantage,
        btBlog: btBlog,
        btStyle: btStyle,
      ),
    );
    notifyListeners(); //Consumer<BartenderService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateItem({
    required int index,
    required String btName,
    required String btMbti,
    required String btAge,
    required String btAdvantage,
    required String btBlog,
    required String btStyle,
  }) {
    btList[index].btName = btName;
    btList[index].btMbti = btMbti;
    btList[index].btAge = btAge;
    btList[index].btBlog = btBlog;
    btList[index].btStyle = btStyle;
    btList[index].btAdvantage = btAdvantage;
    notifyListeners();
  }

  removeItem({required int index}) {
    btList.removeAt(index);
    notifyListeners();
  }
}
