// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaAvatar extends StatelessWidget {
  String path;
  String path_links;
  SocialMediaAvatar({
    super.key,
    required this.path,
    required this.path_links,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child:
          // ignore: unnecessary_string_interpolations
          InkWell(
            child: CircleAvatar(
                  backgroundImage: AssetImage(
                   'assets/$path',
                  ),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
                onTap: () {
                  launchUrl(Uri.parse(path_links),mode: LaunchMode.externalApplication);
                },
          ),
    );
  }
}
