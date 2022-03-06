import 'package:currency/core/components/decoration.dart';
import 'package:currency/core/components/mytext.dart';
import 'package:currency/core/constants/colors.dart';
import 'package:currency/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: AppBarWidget(text: "About Us"),
            ),
            Expanded(
                flex: 8,
                child: Container(
                  color: MyColor.kWhite,
                ),),
          ],
        ),
        Center(
          child: Positioned(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: MyBoxDecoration.boxDecWithShadow(
                color: MyColor.kWhite, shadowColor: MyColor.kPrimaryColor),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: MyColor.kGreen,
                        )),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: MyText(
                          text:
                              "The program is integrated online through the National Bank of Uzbekistan. It is also possible to calculate the value of the two currencies.",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          FontAwesomeIcons.infoCircle,
                          color: MyColor.kGreen,
                        ),),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: MyText(
                            text:
                                "Subscribe to our social networking pages for more information 😊:"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.telegramPlane),
                      onPressed: () {
                        launch('https://t.me/ilyosyusuf');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.instagram),
                      onPressed: () {
                        launch('https://instagram.com/ilyos_yusuf');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.facebookF),
                      onPressed: () {
                        launch('https://facebook.com/ilyosyusuf17');
                      },
                    ),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github),
                      onPressed: () {
                        launch('https://github.com/ilyosyusuf');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset('assets/images/frame.png'),
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
}
