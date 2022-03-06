import 'package:currency/core/components/mytext.dart';
import 'package:currency/core/constants/colors.dart';
import 'package:currency/models/currency_model.dart';
import 'package:currency/screens/converter_page.dart';
import 'package:currency/screens/exchange_page.dart';
import 'package:currency/screens/info_page.dart';
import 'package:currency/service/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Widget>? _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      ConverterPage(),
      ExchangePage(),
      InfoPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,    
      body: SafeArea(child: _pages![_currentIndex]),
      bottomNavigationBar: _bottomBar,
    );
  }

  SalomonBottomBar get _bottomBar {
    return SalomonBottomBar(
      margin: const EdgeInsets.all(10.0),
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      selectedItemColor: MyColor.kPrimaryColor,
      unselectedItemColor: MyColor.kGreen,
      items: [
        /// Currency Converter
        SalomonBottomBarItem(
          icon: const Icon(Icons.currency_exchange_outlined),
          title: const Text("Currency converter"),
        ),

        // Exchange Rates
        SalomonBottomBarItem(
          icon: const Icon(Icons.trending_up),
          title: const Text("Exchange rates"),
        ),

        /// About Us
        SalomonBottomBarItem(
          icon: const Icon(Icons.info_outline),
          title: const Text("About Us"),
        ),
      ],
    );
  }
}
