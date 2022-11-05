import 'package:equatable/equatable.dart';

class Fizzbuzz extends Equatable {
  final int index;
  final int value;
  final String text;

  const Fizzbuzz({required this.index, required this.value, required this.text});

  @override
  List<Object?> get props => [index, value, text];
}
