import 'package:flutter/material.dart';

class HomePageGenarateButton extends StatelessWidget {
  final bool visibility;
  final Function onPressed;
  const HomePageGenarateButton({
    Key? key,
    required this.visibility,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ElevatedButton(onPressed: () => onPressed(), child: const Text('GENARATE')),
      ),
    );
  }
}
