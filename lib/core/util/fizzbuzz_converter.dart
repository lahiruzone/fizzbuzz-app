import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';

class FizzbuzzConverter {
  Fizzbuzz indexToFizzbuzz(int index) {
    String text = '';
    int value = index + 1;
    if (value % 3 == 0) {
      text = "${text}Fizz";
    }
    if (value % 5 == 0) {
      text = "${text}Buzz";
    }
    if (text.isEmpty) {
      text = (value).toString();
    }
    return Fizzbuzz(index: index, value: value, text: text);
  }
}
