import 'package:get_it/get_it.dart';
import 'package:random_quote_generator/features/quotes/data/data_source/quote_data_source.dart';
import 'package:random_quote_generator/features/quotes/data/data_source/quote_data_source_impl.dart';
import 'package:random_quote_generator/features/quotes/data/repository/quote_repository_impl.dart';
import 'package:random_quote_generator/features/quotes/domain/repository/quote_repository.dart';
import 'package:random_quote_generator/features/quotes/domain/usecase/quote_usecase.dart';
import 'package:random_quote_generator/features/quotes/presentaion/cubit/quote_cubit.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Dependencies Here
}
Future<void> init() async {
  // =========================
  // Data Source
  // =========================

  sl.registerLazySingleton<QuoteLocalDataSource>(
    () => QuoteLocalDataSourceImpl(),
  );

  // =========================
  // Repository
  // =========================

  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(localDataSource: sl()),
  );

  // =========================
  // Use Cases
  // =========================

  sl.registerLazySingleton(() => GetRandomQuoteUseCase(repository: sl()));

  // =========================
  // Cubit
  // =========================

  sl.registerFactory(() => QuoteCubit(getRandomQuoteUseCase: sl()));
}
