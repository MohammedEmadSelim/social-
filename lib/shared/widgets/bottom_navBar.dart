import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../screens/screens.dart';
import '../screens.dart';

// ignore: must_be_immutable
class BottumNavBar extends StatelessWidget {
  BottumNavBar({
    super.key,
    this.itemColor,
  });
  static int? currentIndexForEachNavBarIcon;
  Color? itemColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: BottomNavigationBar(
        unselectedItemColor: white,
        backgroundColor: navBarColor,
        selectedItemColor: itemColor ?? orange,
        currentIndex: currentIndexForEachNavBarIcon ?? 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.globe), label: ''),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userGroup), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ''),
        ],
        onTap: (value) {
          if (value == 0) {
            currentIndexForEachNavBarIcon = 0;
            navigate(context, HomeScreen());
          } else if (value == 1) {
            currentIndexForEachNavBarIcon = 1;
            navigate(context, MyNetworkScreen());
          } else if (value == 2) {
            currentIndexForEachNavBarIcon = 2;
            navigate(context, GroupsScreen());
          } else if (value == 3) {
            currentIndexForEachNavBarIcon = 3;
            navigate(context, ProfileScreen());
          }
        },
      ),
    );
  }
}
