import 'package:flutter/material.dart';

void navigate(BuildContext context, Widget route) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => route));
}
