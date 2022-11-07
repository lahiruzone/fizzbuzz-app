part of 'user_input_cubit.dart';

enum FormStatus { pure, invalied, valied }

class UserInputState extends Equatable {
  final FormStatus status;
  final int? limit;
  final ApplicationError? applicationError;

  const UserInputState({this.status = FormStatus.pure, this.limit, this.applicationError});

  @override
  List<Object?> get props => [status, limit, applicationError];

  UserInputState copyWith({
    FormStatus? status,
    int? limit,
    ApplicationError? applicationError,
  }) {
    return UserInputState(
      status: status ?? this.status,
      limit: limit ?? this.limit,
      applicationError: applicationError ?? this.applicationError,
    );
  }
}
