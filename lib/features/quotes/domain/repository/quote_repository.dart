import 'package:random_quote_generator/features/quotes/domain/entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<QuoteEntity> getRandomQuote();
}
