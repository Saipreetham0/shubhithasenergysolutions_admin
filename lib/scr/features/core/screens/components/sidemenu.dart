import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';
import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/AdminPanel.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // const SideMenu({
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(color: tsecondaryBg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20),
                child: const SizedBox(
                  width: 35,
                  height: 20,
                  // child: SvgPicture.asset('assets/mac-action.svg'),
                ),
              ),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  onPressed: () {
                    Get.to(() => adminPanel());
                  },
                  icon: LineIcon(
                    LineIcons.home,
                    size: 20,
                  )),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  onPressed: () {
                    Get.to(() => adminPanel());
                  },
                  icon: LineIcon(
                    LineIcons.fileInvoice,
                    size: 20,
                  )),
              IconButton(
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                onPressed: () {},
                icon: LineIcon(
                  LineIcons.comments,
                  size: 20,
                ),
              ),
              IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  onPressed: () {},
                  icon: LineIcon(
                    LineIcons.userFriends,
                    size: 20,
                  )),
              IconButton(
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                onPressed: () {},
                icon: const Icon(
                  Icons.notification_add_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
