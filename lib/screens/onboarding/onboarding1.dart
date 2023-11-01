import 'package:flutter/material.dart';
import '../../shared/screens.dart';
import '../screens.dart';



// ignore: camel_case_types
class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: navy,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(64),
              child: Image(image: AssetImage('assets/Connecting.jpg')),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              'My network app is the best app for connecting people',
              style: h5,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButton: ActionButton(
        title: 'Next',
        action: () {
          navigate(context, Onboarding2Screen());
          },
      ),
    ));
  }
}
