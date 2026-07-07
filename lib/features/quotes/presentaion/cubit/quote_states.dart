import 'package:random_quote_generator/features/quotes/domain/entities/quote_entity.dart';

abstract class QuoteState {
  const QuoteState();
}

class QuoteInitial extends QuoteState {
  const QuoteInitial();
}

class QuoteLoading extends QuoteState {
  const QuoteLoading();
}

class QuoteLoaded extends QuoteState {
  final QuoteEntity quote;

  const QuoteLoaded({required this.quote});
}

class QuoteError extends QuoteState {
  final String message;

  const QuoteError({required this.message});
}
