import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency/core/components/decoration.dart';
import 'package:currency/core/components/mytext.dart';
import 'package:currency/core/constants/colors.dart';
import 'package:currency/data/code_info_data.dart';
import 'package:currency/data/flag_data.dart';
import 'package:currency/models/currency_model.dart';
import 'package:currency/service/currency_service.dart';
import 'package:currency/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangePage extends StatefulWidget {
  CurrencyModel? currencyModel;
  ExchangePage({Key? key, this.currencyModel}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
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
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: AppBarWidget(text: "Exchange rates"),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                radius: 25.0,
                                backgroundImage: CachedNetworkImageProvider(
                                    FlagData.flagList[i])),
                            title: MyText(
                              text: data[i].title.toString(),
                              color: MyColor.kPrimaryColor,
                            ),
                            subtitle: MyText(
                              text: "${data[i].cbPrice} UZS",
                              size: 16,
                              color: MyColor.kPrimaryGrey,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.infoCircle,
                                color: MyColor.kGreen,
                              ),
                              onPressed: () async {
                                launch(CodeInfoData.codeInfoList[i]);
                              },
                            ),
                          ),
                          const Divider(thickness: 0.5)
                        ],
                      );
                    },
                    itemCount: data.length,
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
