import 'package:flutter/material.dart';
import 'package:flutter_application_2/shared/widgets/bottom_navBar.dart';
import 'screens.dart';
import '../shared/screens.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: teal,
      appBar: AppBar(
        leading:MyBackButton(),
        title: Text(
          'Groups',
        ),
      ),
      body: GridView.builder(
        itemCount: 18,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          
        ),
        itemBuilder: (
          context,
          index,
        ) {
          return GroupItem();
        },
        physics: BouncingScrollPhysics(),
        // padding: EdgeInsets.all(5),
      ),
      bottomNavigationBar: BottumNavBar(),
    );
  }
}
