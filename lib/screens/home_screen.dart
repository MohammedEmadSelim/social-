import 'package:flutter/material.dart';
import 'package:flutter_application_2/shared/widgets/bottom_navBar.dart';
import './screens.dart';
import '../shared/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: teal,
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.phone,
                cursorColor: white,
                style: title1,
                decoration: InputDecoration(
                  label: Text('Enter your number.'),
                  labelStyle: title1,
                  // hintText: '012******',
                  // hintStyle: title1,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(
                      color: white,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        color: white,
                        width: 2,
                      )),
                ),
              ),
              ActionButtonWithIcon(
                icon: Icon(Icons.search),
                title: Text('Search'),
                action: () {
                  navigate(context, Onboarding1Screen());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:BottumNavBar()
    );
  }
}
