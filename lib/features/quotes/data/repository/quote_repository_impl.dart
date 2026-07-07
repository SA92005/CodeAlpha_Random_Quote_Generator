import 'dart:math';

import 'package:random_quote_generator/features/quotes/data/data_source/quote_data_source.dart';
import 'package:random_quote_generator/features/quotes/domain/entities/quote_entity.dart';
import 'package:random_quote_generator/features/quotes/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteLocalDataSource localDataSource;

  QuoteRepositoryImpl({required this.localDataSource});

  @override
  Future<QuoteEntity> getRandomQuote() async {
    final quotes = await localDataSource.getQuotes();

    final random = Random();
    final randomIndex = random.nextInt(quotes.length);

    final randomQuote = quotes[randomIndex];

    return randomQuote.toEntity();
  }
}
