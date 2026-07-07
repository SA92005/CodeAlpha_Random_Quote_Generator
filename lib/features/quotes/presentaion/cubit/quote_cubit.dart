import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_generator/features/quotes/domain/usecase/quote_usecase.dart';
import 'package:random_quote_generator/features/quotes/presentaion/cubit/quote_states.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  QuoteCubit({required this.getRandomQuoteUseCase})
    : super(const QuoteInitial());

  Future<void> getRandomQuote() async {
    try {
      emit(const QuoteLoading());

      final quote = await getRandomQuoteUseCase();

      emit(QuoteLoaded(quote: quote));
    } catch (e) {
      emit(QuoteError(message: e.toString()));
    }
  }
}
