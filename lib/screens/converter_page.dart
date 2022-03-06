import 'package:currency/core/components/decoration.dart';
import 'package:currency/core/components/mytext.dart';
import 'package:currency/core/constants/colors.dart';
import 'package:currency/models/currency_model.dart';
import 'package:currency/service/currency_service.dart';
import 'package:currency/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ConverterPage extends StatefulWidget {
  CurrencyModel? currencyModel;
  ConverterPage({Key? key, this.currencyModel}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  String title1 = "AED";
  String title2 = "AED";
  num results = 0;
  final TextEditingController _valController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CurrencyService.getCurrencies(),
      builder: (context, AsyncSnapshot<List<CurrencyModel>> snap) {
        if (!snap.hasData) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (snap.hasError) {
          return Center(
            child: MyText(
              text: "Something went wrong :( Check your internet connection",
              color: MyColor.kPrimaryColor,
            ),
          );
        } else {
          var data = snap.data!;
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppBarWidget(
                      text: "Converter",
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: MyColor.kWhite,
                    ),
                  )
                ],
              ),
              Center(
                child: Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: const EdgeInsets.all(10.0),
                    decoration: MyBoxDecoration.boxDecWithShadow(
                        color: MyColor.kWhite,
                        shadowColor: MyColor.kPrimaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _valController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: MyColor.kPrimaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                        color: MyColor.kPrimaryColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                              padding: const EdgeInsets.all(5.0),
                              decoration: MyBoxDecoration.boxDecoration(
                                  color2: MyColor.kGreen),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: title1,
                                  items: List.generate(
                                    data.length,
                                    (index) => DropdownMenuItem(
                                      child: Text(
                                        data[index].code.toString(),
                                      ),
                                      value: data[index].code,
                                    ),
                                  ),
                                  onChanged: (v) {
                                    title1 = v.toString();
                                    setState(() {});
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.currency_exchange,
                              size: 40, color: MyColor.kGreen),
                          onPressed: () {
                            if (_valController.text.isEmpty) {
                              results = 0;
                              setState(() {});
                            }
                            for (int i = 0; i < data.length; i++) {
                              for (int j = 0; j < data.length; j++) {
                                if (title1 == data[i].code.toString() &&
                                    title2 == data[j].code.toString()) {
                                  results = double.parse(_valController.text) *
                                      double.parse(data[i].cbPrice!) /
                                      double.parse(data[j].cbPrice!);
                                  setState(() {});
                                }
                              }
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height:
                                    MediaQuery.of(context).size.height * 0.070,
                                padding: const EdgeInsets.all(5.0),
                                decoration: MyBoxDecoration.boxDecoration(
                                    color2: MyColor.kPrimaryColor),
                                child: MyText(text: results.toStringAsFixed(2)),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                              padding: const EdgeInsets.all(5.0),
                              decoration: MyBoxDecoration.boxDecoration(
                                  color2: MyColor.kGreen),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: title2,
                                  items: List.generate(
                                    data.length,
                                    (index) => DropdownMenuItem(
                                      child: Text(
                                        data[index].code.toString(),
                                      ),
                                      value: data[index].code,
                                    ),
                                  ),
                                  onChanged: (v) {
                                    title2 = v.toString();
                                    setState(() {});
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 75,
                child: InkWell(
                  child: Container(
                    width: 250,
                    height: 100,
                    alignment: Alignment.topCenter,
                    child: MyText(
                      text: "Made by",
                      color: MyColor.kGreen,
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/ilyosyusuf.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  onTap: () {
                    launch('https://t.me/ilyosyusuf');
                  },
                ),
              )
            ],
          );
        }
      },
    );
  }
}
