import 'package:flutter/material.dart';

final grey = Colors.black.withOpacity(.4);
const black = Color(0xff262626);
const lightGrey = Color(0xff8D8D8D);
const darkGrey = Color(0xff787878);
const darkBlue = Color(0xff0B2556);
const donker = Color(0xff12283d);
const bg = Color(0xffeeeeee);
const lightCyan = Color(0xffe0ebf3);
const darkCyan = Color(0xff384a5c);
const green = Color(0xff7dbdbd);
final greyText = TextStyle(
  fontFamily: 'Gilroy',
  color: grey,
);
const lightGreyText = TextStyle(
  fontFamily: 'Gilroy',
  color: lightGrey,
);
const blackText = TextStyle(
  fontFamily: 'Gilroy',
  color: black,
);
const whiteText = TextStyle(
  fontFamily: 'Gilroy',
  color: Colors.white,
);
const cyanText = TextStyle(
  fontFamily: 'Gilroy',
  color: Color(0xffb8bec5),
);

const darkBlueText = TextStyle(
  fontFamily: 'Gilroy',
  color: darkBlue,
);

const donkerText = TextStyle(
  fontFamily: 'Gilroy',
  color: donker,
);

const regular = FontWeight.normal;
const medium = FontWeight.w500;
const bold = FontWeight.w700;

spaceV(double height) {
  return SizedBox(
    height: height,
  );
}

spaceH(double width) {
  return SizedBox(
    width: width,
  );
}
