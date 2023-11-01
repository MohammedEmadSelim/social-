import 'package:flutter/material.dart';

import '../../shared/screens.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(39),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(navy, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage('assets/work.jpg'),
            ),
          ),
        ),
        Center(
          child: Text(
            'work',
            style: h3Bold,
          ),
        )
      ],
    );
  }
}
