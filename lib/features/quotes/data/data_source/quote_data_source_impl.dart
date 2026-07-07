import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:random_quote_generator/features/quotes/data/data_source/quote_data_source.dart';
import 'package:random_quote_generator/features/quotes/data/model/quote_model.dart';

class QuoteLocalDataSourceImpl implements QuoteLocalDataSource {
  @override
  Future<List<QuoteModel>> getQuotes() async {
    final jsonString = await rootBundle.loadString('assets/quotes/quotes.json');

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .map((json) => QuoteModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
