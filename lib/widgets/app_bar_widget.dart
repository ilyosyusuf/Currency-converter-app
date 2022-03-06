import 'package:currency/core/components/decoration.dart';
import 'package:currency/core/components/mytext.dart';
import 'package:currency/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  String text;
  AppBarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      alignment: Alignment.center,
      child: MyText(
        text: text,
        size: 40.0,
        color: MyColor.kWhite,
      ),
      decoration: MyBoxDecoration.bottomBorder(
        color: MyColor.kPrimaryColor,
      ),
    );
  }
}
