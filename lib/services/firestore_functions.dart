import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../shared/screens.dart';
import 'services.dart';

class fireBseServices {
  var fireStoreRef = FirebaseFirestore.instance;
  var userColRef = FirebaseFirestore.instance.collection('Users');

  createUser(
      {required String name,
      required String phoneNumber,
      required BuildContext context}) async {
    var ref = await fireStoreRef.collection('Users').doc(name);
    var user = UserModel(
      name: name,
      phoneNumber: phoneNumber,
      img:
          'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/354632298_1008918730103131_5221622560508232301_n.jpg?stp=cp6_dst-jpg&_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGbqv72FvY6t-p-LxCxH-BJB0KEfNcSzCQHQoR81xLMJC0YWfMzAaR7nhF87LjTHN54vhrXbt8zBA6GdfkI3NJq&_nc_ohc=Cty8gKNgaPIAX_KNFu_&_nc_ht=scontent-hbe1-1.xx&oh=00_AfCnbglXTD58wDYqh8ug92ZZhCC-GJrwkeKBGTkHc2Gyjw&oe=64D81278',
      socialMedia: {
        'whatsapp.png': 'https://wa.me/+201000927095',
        'facebook.png':
            'https://web.facebook.com/profile.php?id=100029550412774',
        'youtube.png': 'https://www.youtube.com/@GammalTech',
      },
    );
    ref.set((user.toMMap()));
    // create snackbar at the bottom of screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Created',
          style: title1,
        ),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        duration: Duration(seconds: 2),
        closeIconColor: white,
      ),
    );
    // function builded by mohamed emad selim to go to another class
    navigate(context, ProfileScreen());
  }

  Future<UserModel> getUser() async {
    // accessing data from firestore
    var ref = userColRef.doc('mohammed');
    var myData = await ref.get();
    // translate data from firebase to object
    var trueData = UserModel().fromMap(myData.data());
    return trueData;
  }

  //getting al list of collection from firestore
  Stream<List<UserModel>> getNetwork() {
    var ref = FirebaseFirestore.instance
        .collection('Users')
        .snapshots()
        .map((event) => event.docs
            .map(
              (e) => UserModel().fromMap(
                e.data(),
              ),
            )
            .toList());
    return ref;
  }
  Future<List<UserModel>> getNetworkByFuture()async{
     var ref = FirebaseFirestore.instance.collection('Users');
     var documnets = await ref.get();
     var myUsersDocs = documnets.docs.map((e) => e.data());
     var trueData = myUsersDocs.map((e) => UserModel().fromMap(e));
     return trueData.toList();
  }
}