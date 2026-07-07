import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int id;
  final String text;
  final String author;

  const QuoteEntity({
    required this.id,
    required this.text,
    required this.author,
  });

  @override
  List<Object> get props => [id, text, author];
}
