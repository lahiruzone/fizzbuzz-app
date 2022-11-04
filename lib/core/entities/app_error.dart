import 'package:equatable/equatable.dart';

class ApplicationError extends Equatable {
  final String code;
  final String message;

  const ApplicationError({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}
