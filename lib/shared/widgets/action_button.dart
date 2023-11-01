import 'package:flutter/material.dart';
import 'package:flutter_application_2/shared/screens.dart';


// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  ActionButton({
    super.key,
    required this.title,
    required this.action,
    this.buttonColor,
    this.elevation,
    this.butnWidth,
    this.btnHeight,
    this.titleStyle,

  });
  String title;
  Color? buttonColor;
  double? elevation;
  double? butnWidth;
  double? btnHeight;
  TextStyle? titleStyle;


  Function() action;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: butnWidth ,
      height: btnHeight,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? orange,
            elevation: elevation ?? 8 ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            )),
        child: Text(title,style: titleStyle,),
      ),
    );
  }
}

// ignore: must_be_immutable
class ActionButtonWithIcon extends StatelessWidget {
  ActionButtonWithIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.action,
      this.backgroundColor});
  Text title;
  Icon icon;
  VoidCallback action;
  Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: action,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )),
      icon: icon,
      label: title,
    );
  }
}
