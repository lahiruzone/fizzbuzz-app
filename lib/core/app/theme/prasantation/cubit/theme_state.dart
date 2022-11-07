part of 'theme_cubit.dart';

enum ThemeStatus { light, dark }

class ThemeState extends Equatable {
  final ThemeStatus state;
  final ThemeData themeData;

  const ThemeState({this.state = ThemeStatus.light, required this.themeData});

  @override
  List<Object> get props => [state, themeData];

  bool get darkMode => state == ThemeStatus.dark;

  ThemeState copyWith({
    ThemeStatus? state,
    ThemeData? themeData,
  }) {
    return ThemeState(
      state: state ?? this.state,
      themeData: themeData ?? this.themeData,
    );
  }
}
