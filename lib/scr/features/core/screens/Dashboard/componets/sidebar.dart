import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/shared_componets/selection_button.dart';
import 'package:shubhithasenergysolutions_admin/scr/shared_componets/upgradePremiumCard.dart';

class sidebar extends StatefulWidget {
  final int select;
  const sidebar({super.key, required this.select});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ProjectCard(
                  //     // data: data,
                  //     ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                        'assets/images/splash-screen/APP_LOGO_ROW.png'),
                  ),
                  const SizedBox(width: 2),
                  const Text('SHUBHITHA S \nENERGY SOLUTIONS',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      )),
                ],
              ),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              initialSelected: widget.select,
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: "Dashboard",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: "Site Visit Reports",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.fileText,
                  icon: EvaIcons.fileTextOutline,
                  label: "Total Quotations",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.bell,
                  icon: EvaIcons.bellOutline,
                  label: "Notifications",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: "Users",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.settings,
                  icon: EvaIcons.settingsOutline,
                  label: "Settings",
                ),
              ],
              onSelected: (index, value) {
                // log("index : $index | label : ${value.label}");
                print("index : $index | label : ${value.label}");

                switch (index) {
                  case 0:
                    Get.offNamed('/dashboard');

                    break;
                  case 1:
                    Get.offNamed('/siteVistReports');
                    break;
                  case 2:
                    Get.offNamed('/totalQuotations');
                    break;
                  case 3:
                    Get.offNamed('/notifications');
                    break;
                  case 4:
                    Get.offNamed('/users');
                    break;
                  case 5:
                    Get.offNamed('/settings');
                    break;
                  default:
                }
              },
            ),
            const Divider(thickness: 1),
            // const SizedBox(height: 20 * 2),
            SizedBox(height: size.height * 0.3),

            // UpgradePremiumCard(
            //   backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
            //   onPressed: () {},
            // ),
            // const SizedBox(height: 20),

            Align(
              alignment: Alignment.bottomCenter,
              child: Text(' ${user?.email}'),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  // height: 40,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(
                      Icons.logout,
                      size: 15,
                    ),
                    label: const Text('Logout'),
                  ),
                ),
              ),
            ),

            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
