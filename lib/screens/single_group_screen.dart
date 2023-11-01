import 'package:flutter/material.dart';
import '../shared/screens.dart';
import 'screens.dart';

class SingleGroupScreen extends StatelessWidget {
  const SingleGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: teal,
      appBar: AppBar(
        leading: MyBackButton(),
        title: Text(
          'Work',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage('assets/work.jpg'),
              ),
            ),
            Text(
              'Group Members',
              style: h3Bold.merge(
                TextStyle(color: lightOrange),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                    // ContactCard(),
                    // SizedBox(height: 20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottumNavBar(itemColor: white,),
    );
  }
}
