import 'package:random_quote_generator/features/quotes/data/model/quote_model.dart';

abstract class QuoteLocalDataSource {
  Future<List<QuoteModel>> getQuotes();
}
