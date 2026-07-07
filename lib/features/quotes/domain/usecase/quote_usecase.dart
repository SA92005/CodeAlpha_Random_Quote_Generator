import 'package:random_quote_generator/features/quotes/domain/entities/quote_entity.dart';
import 'package:random_quote_generator/features/quotes/domain/repository/quote_repository.dart';

class GetRandomQuoteUseCase {
  final QuoteRepository repository;

  GetRandomQuoteUseCase({required this.repository});

  Future<QuoteEntity> call() {
    return repository.getRandomQuote();
  }
}
