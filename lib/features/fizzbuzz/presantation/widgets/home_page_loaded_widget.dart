import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:flutter/material.dart';

class HomePageLoadedWidget extends StatelessWidget {
  final List<Fizzbuzz> fizzbuzzList;
  const HomePageLoadedWidget({
    Key? key,
    required this.fizzbuzzList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scollBarController = ScrollController();
    return Scrollbar(
      controller: scollBarController,
      thumbVisibility: true,
      child: ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: scollBarController,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: fizzbuzzList.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(fizzbuzzList[index].text),
              ))),
    );
  }
}
