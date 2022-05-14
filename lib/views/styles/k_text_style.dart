import 'package:flutter/cupertino.dart';

/*
Focus: To maintain app wide design consistency all
the text style that are used in this app should be
declared here.

*Note: In special case: When let's say one title
text or textButton theme needsto be different,
say the color needs to be red instead of Black.
Don't create titleStyle1 (-_-). Just follow this:
Code Snippet:  (Applicable for all styles)
Text(segmentTitle,
style: AppTextStyle.titleStyle.copyWith(color: KColor.red)),
*/

class KTextStyle {
  static TextStyle headline1 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w500,
    letterSpacing: -1.5,
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w300,
  );

  static TextStyle headline3 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle headline4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static TextStyle headline5 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  static TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static TextStyle bodyText3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.04,
    height: 1.6,
  );

  static TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  static TextStyle overline = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}
