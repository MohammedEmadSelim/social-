import 'package:flutter/material.dart';
import './screens.dart';
import '../shared/screens.dart';
import '../services/services.dart';

class MyNetworkScreen extends StatelessWidget {
  const MyNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fireBseServices().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            backgroundColor: teal,
            body: Center(
              child: Text(
                'Wating',
                style: h3,
              ),
            ),
          );
        else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: teal,
            body: Center(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else if (snapshot.hasData) {
          var listData = snapshot.data;
          var userNetwork = listData!.myNetwork;
          // not used just written to bo known
          var gammalTechSolveFRIENDS = userNetwork!.map((e) => UserModel().fromMap(e)).toList();
          return Scaffold(
            extendBody: true,
            backgroundColor: teal,
            appBar: AppBar(
              title: Text(
                'My Network',
              ),
              leading: MyBackButton(),
              backgroundColor: transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  //this step sloved before see it's lesson thanks to allah
                  //return ContactCard(user: UserModel().fromMap(userNetwork[index]),);
                  return ContactCard(user: gammalTechSolveFRIENDS[index]);
                  
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: lightOrange,
                    thickness: 1,
                  );
                },
                itemCount: userNetwork!.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            bottomNavigationBar: BottumNavBar(),
          );
        } else {
          return Scaffold(
            backgroundColor: teal,
            body: Center(
              child: Text("no data"),
            ),
          );
        }
      },
    );
  }
}
