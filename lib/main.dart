import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_quote_generator/features/quotes/presentaion/cubit/quote_cubit.dart';
import 'package:random_quote_generator/features/quotes/presentaion/ui/quote_page.dart';

import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    BlocProvider(create: (context) => sl<QuoteCubit>(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuotePage(),
    );
  }
}
