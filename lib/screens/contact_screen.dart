// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens.dart';
import 'widgets/social_media_icon.dart';
import '../../shared/screens.dart';

// ignore: must_be_immutable
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  @override
  Map<String, String> pathses = {
    'whatsapp.png': 'https://wa.me/+201000927095',
    'facebook.png': 'https://web.facebook.com/profile.php?id=100029550412774',
    'youtube.png': 'https://www.youtube.com/@GammalTech',
    'social.png': 'https://github.com/MohammedEmadSelim',
    'instagram.png': 'https://www.instagram.com/mohammedemad586/',
    'linkedin.png': 'https://www.linkedin.com/in/mohammed-selim-523239215/',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading:MyBackButton()
      ),
      backgroundColor: teal,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/mohamdAbdo.jpeg'),
                radius: 100,
              ),
              Text(
                'Mohammed Emad',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              ActionButtonWithIcon(
                  title: Text('add to my network'),
                  icon: Icon(Icons.add),
                  action: () {
                    print('contact added');
                  }),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '01000927095',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+201000927095'));
                    },
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                itemCount: pathses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (
                  context,
                  index,
                ) {
                  return SocialMediaAvatar(
                    path: pathses.keys.toList()[index],
                    path_links: pathses.values.toList()[index],
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottumNavBar(itemColor: white,),
    );
  }
}
