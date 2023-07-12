import 'package:flutter/material.dart';

import 'main.dart';

class Bartender {
  Bartender({
    required this.content,
  });

  String content;
}

class BartenderService extends ChangeNotifier {
  List<Bartender> btList = [
    Bartender(content: '바텐더 소개'),
  ];
}
