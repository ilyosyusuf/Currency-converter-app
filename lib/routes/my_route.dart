import 'package:currency/screens/main_page.dart';
import 'package:flutter/material.dart';


class MyRoute{
  Route? onGenerateRoute(RouteSettings settings){
    var arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_)=> MainPage());
      // case '/':
      //   return MaterialPageRoute(builder: (_)=> MyHomePage());
      // case '/search':
      //   return MaterialPageRoute(builder: (_)=> SearchPage(pModel: arguments as List<Pokemon>));
      //       case '/details':
      //   return MaterialPageRoute(builder: (_)=> DetailsPage( detail: arguments as Pokemon));
    }
  }
}