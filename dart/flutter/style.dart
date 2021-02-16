import 'package:flutter/material.dart';

class AppColors {
  static const Color base = Colors.black12;
  static const Color success = Colors.lightGreen;
  static const Color danger = Colors.red;
  static const Color warning = Colors.yellowAccent;
  static const Color info = Colors.black38;
  static const Color primary = Colors.brown;

  static const Color text = Colors.black87;
  static const Color placeholder = info;
}

class AppSpaces {
  static const double single = 8;

  static const double screenHorizontal = single * 2;
}

class AppFontSizes {
  static const double xxs = 10;
  static const double xs = 12;
  static const double s = 14;
  static const double m = 16;
  static const double l = 18;
  static const double xl = 20;
}

class AppFontStyles {
  static const TextStyle xxs =
      TextStyle(fontSize: AppFontSizes.xxs, fontWeight: FontWeight.normal);
  static const TextStyle boldXxs =
      TextStyle(fontSize: AppFontSizes.xxs, fontWeight: FontWeight.bold);
  static const TextStyle xs =
      TextStyle(fontSize: AppFontSizes.xs, fontWeight: FontWeight.normal);
  static const TextStyle boldXs =
      TextStyle(fontSize: AppFontSizes.xs, fontWeight: FontWeight.bold);
  static const TextStyle s =
      TextStyle(fontSize: AppFontSizes.s, fontWeight: FontWeight.normal);
  static const TextStyle boldS =
      TextStyle(fontSize: AppFontSizes.s, fontWeight: FontWeight.bold);
  static const TextStyle m =
      TextStyle(fontSize: AppFontSizes.m, fontWeight: FontWeight.normal);
  static const TextStyle boldM =
      TextStyle(fontSize: AppFontSizes.m, fontWeight: FontWeight.bold);
  static const TextStyle l =
      TextStyle(fontSize: AppFontSizes.l, fontWeight: FontWeight.normal);
  static const TextStyle boldL =
      TextStyle(fontSize: AppFontSizes.l, fontWeight: FontWeight.bold);
}
