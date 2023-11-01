// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/screens.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../services/services.dart';
import '../shared/screens.dart';
import 'widgets/screens_widgets.dart';


// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
    return FutureBuilder(
      future: fireBseServices().getUser(),
      builder: (context, snapshot) {
        // to send on screen wating until database send data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: teal,
            body: Center(
              child: Text('Wating',style: h3,),
            ),
          );
        } 
        // if database returned error
         if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: teal,
            body: Center(
              child: Text(snapshot.error.toString(),style: h3,),
            ),
          );
        }
        // when database returned data 
        if (snapshot.hasData) {
          UserModel profileOwner;
          profileOwner = snapshot.data!;
          return 
          // the orginal screen after receving data
          Scaffold(
            extendBody: true,
            appBar: AppBar(
              title: Text('${profileOwner.name}'),
              leading: MyBackButton(),
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
                      backgroundImage: NetworkImage('${profileOwner.img}'),
                      radius: 100,
                    ),
                    Text(
                      '${profileOwner.name}',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActionButton(
                            title: 'Edite Profile',
                            buttonColor: lightOrange,
                            elevation: 0.0,
                            action: () {
                              print('Profile Edited');
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        ActionButton(
                            title: 'Delete Profile',
                            buttonColor: lightRed,
                            action: () {
                              AwesomeDialog(
                                context: context,
                                descTextStyle: title1
                                    .merge(TextStyle(color: Colors.black)),
                                titleTextStyle: h4Bold
                                    .merge(TextStyle(color: Colors.black)),
                                dialogType: DialogType.noHeader,
                                animType: AnimType.rightSlide,
                                title: 'Delete Profile',
                                desc: 'That Ation Going To Delete your Profile',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  print('Profile Deleted');
                                },
                              ).show();
                            }),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${profileOwner.phoneNumber}',
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse('tel:+2${profileOwner.phoneNumber}'));
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
                      itemCount: profileOwner.socialMedia!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return SocialMediaAvatar(
                          path: profileOwner.socialMedia!.keys.toList()[index],
                          path_links: profileOwner.socialMedia!.values.toList()[index],
                        );
                      },
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(20),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottumNavBar(),
          );
        }
        // this case is used if the up three cases not used
         
          return Scaffold(
            body: Center(
              child: Text('no data'),
            ),
          );
        
      },
    );
  }
}
