import 'package:currency/core/api/api.dart';
import 'package:currency/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CurrencyService{
  static Future<List<CurrencyModel>> getCurrencies()async{
    Response res = await Dio().get(Constants.myApi);

    return (res.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
  }
}