import 'package:random_quote_generator/features/quotes/domain/entities/quote_entity.dart';

class QuoteModel {
  final int id;
  final String text;
  final String author;

  const QuoteModel({
    required this.id,
    required this.text,
    required this.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'] as int,
      text: json['text'] as String,
      author: json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'text': text, 'author': author};
  }

  QuoteEntity toEntity() {
    return QuoteEntity(id: id, text: text, author: author);
  }
}
