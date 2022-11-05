import 'package:equatable/equatable.dart';

class ApplicationError extends Equatable {
  final String message;

  const ApplicationError({required this.message});

  @override
  List<Object> get props => [message];
}
