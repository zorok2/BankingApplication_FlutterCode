import 'package:banking_application/Pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../app_style/app_color/App_color.dart';

class AppbarWiget extends StatefulWidget {
  const AppbarWiget({Key? key}) : super(key: key);

  @override
  State<AppbarWiget> createState() => _AppbarWigetState();
}

class _AppbarWigetState extends State<AppbarWiget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Profile_page(),
                  ));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/useravatar.png',
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text('nguyễn văn nghĩa'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.forum_outlined,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: App_color.primaryColor,
                    size: 24,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
