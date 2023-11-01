import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/services.dart';
import 'package:flutter_application_2/shared/widgets/bottom_navBar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/screens.dart';
import 'widgets/social_media_icon.dart';

// ignore: must_be_immutable
class FriendScreen extends StatelessWidget {
  FriendScreen({
    super.key,
    required this.user,
  });
 UserModel user;
  @override
  // ignore: override_on_non_overriding_member
  // Map<String, String> pathses = {
  //   'whatsapp.png': 'https://wa.me/+201000927095',
  //   'facebook.png': 'https://web.facebook.com/profile.php?id=100029550412774',
  //   'youtube.png': 'https://www.youtube.com/@GammalTech',
  //   'social.png': 'https://github.com/MohammedEmadSelim',
  //   'instagram.png': 'https://www.instagram.com/mohammedemad586/',
  //   'linkedin.png': 'https://www.linkedin.com/in/mohammed-selim-523239215/',
  // };
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
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
                backgroundImage:NetworkImage(user.img!),
                radius: 100,
              ),
              Text(
                '${user.name}',
                style:h3,
              ),
              SizedBox(
                height: 5,
              ),
              ActionButtonWithIcon(
                  title: Text('add to a group'),
                  icon: Icon(Icons.add),
                  action: () {
                    showModalBottomSheet<void>(
                      backgroundColor: transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          height: 300,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        color: grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                              onPressed: () {},
                                              child: Text('.Work',
                                                  style: h4.merge(
                                                      TextStyle(color: black))),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text('.Work',
                                                  style: h4.merge(
                                                      TextStyle(color: black))),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text('.Work',
                                                  style: h4.merge(
                                                      TextStyle(color: black))),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text('.Work',
                                                  style: h4.merge(
                                                      TextStyle(color: black))),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                    print('contact added to a group');
                  }),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${user.phoneNumber}',
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+2${user.phoneNumber}'));
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
                itemCount: user.socialMedia!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (
                  context,
                  index,
                ) {
                  return SocialMediaAvatar(
                    path: user.socialMedia!.keys.toList()[index],
                    path_links: user.socialMedia!.values.toList()[index],
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
      bottomNavigationBar: BottumNavBar(
        itemColor: white,
      ),
    );
  }
}
