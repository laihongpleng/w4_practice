import 'package:flutter/material.dart';

enum CardType { red, blue }

class ColorService extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;

  void increment(CardType type) {
    if (type == CardType.red) {
      redTapCount++;
    } else {
      blueTapCount++;
    }

    notifyListeners();
  }
}

ColorService colorService = ColorService();
