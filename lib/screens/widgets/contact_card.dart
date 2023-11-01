import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/screens.dart';
import 'package:flutter_application_2/services/services.dart';
import '../../shared/screens.dart';

// ignore: must_be_immutable
class ContactCard extends StatelessWidget {
   ContactCard({
    super.key,
    required this.user,
  });
  UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigate(context, FriendScreen(user: user,)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.img!),
            radius: 38.5,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name!,style: h3.merge(TextStyle(color: white)),),
              Text(user.phoneNumber!,style: title1.merge(TextStyle(color: white),)),
            ],
          )
        ],
      ),
    );
  }
}
