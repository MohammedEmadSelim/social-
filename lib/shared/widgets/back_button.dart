import 'package:flutter/material.dart';
import '../themes/Colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 40,
        color: lightOrange,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
