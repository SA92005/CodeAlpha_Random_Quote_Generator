import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_quote_generator/core/theme/app_colors.dart';
import 'package:random_quote_generator/core/theme/app_text_style.dart';
import 'package:random_quote_generator/features/quotes/presentaion/cubit/quote_cubit.dart';
import 'package:random_quote_generator/features/quotes/presentaion/cubit/quote_states.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  void initState() {
    super.initState();
    context.read<QuoteCubit>().getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.backgroundTop,
                  AppColors.backgroundMiddle,
                  AppColors.backgroundBottom,
                ],
              ),
            ),
          ),

          Positioned(
            top: 100,
            right: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blueGlow,
              ),
            ),
          ),

          Positioned(
            bottom: 150,
            left: -100,
            child: Container(
              width: 280,
              height: 280,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.purpleGlow,
              ),
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),

                const Text("من أجلك", style: AppTextStyles.title),

                Expanded(
                  child: BlocBuilder<QuoteCubit, QuoteState>(
                    builder: (context, state) {
                      if (state is QuoteLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.quoteColor,
                          ),
                        );
                      }

                      if (state is QuoteError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: AppTextStyles.error,
                          ),
                        );
                      }

                      if (state is QuoteLoaded) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 20,
                                  sigmaY: 20,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 450,
                                  padding: const EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    color: AppColors.cardBackground,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: AppColors.cardBorder,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        child: Text(
                                          state.quote.text,
                                          key: ValueKey(state.quote.text),
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.quote,
                                        ),
                                      ),

                                      const SizedBox(height: 30),

                                      AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 500,
                                        ),
                                        child: Text(
                                          "- ${state.quote.author} -",
                                          key: ValueKey(state.quote.author),
                                          style: AppTextStyles.author,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),

                // Button
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50,
                    left: 40,
                    right: 40,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<QuoteCubit>().getRandomQuote();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        elevation: 8,
                        shadowColor: AppColors.buttonShadow,
                      ),
                      child: const Text(
                        "مقولة جديدة",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
