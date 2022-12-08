import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/componets/sidebar.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/header.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/siteVistReport/widgets/sitevisitReportsList.dart';

class siteVistReportScreen extends StatefulWidget {
  const siteVistReportScreen({super.key});

  @override
  State<siteVistReportScreen> createState() => _siteVistReportScreenState();
}

class _siteVistReportScreenState extends State<siteVistReportScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final select = 1;

  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
        key: _drawerKey,
        drawer: SizedBox(
            height: size.height,
            width: 300,
            child: sidebar(
              select: select,
            )),
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                    onPressed: () {
                      _drawerKey.currentState?.openDrawer();
                      // sidebar();
                    },
                    icon: const Icon(Icons.menu, color: Colors.black)),
                actions: const [
                  // AppBarActionItems(),
                ],
              )
            : const PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: sidebar(
                      select: select,
                    ),
                  ),
                ),
              Expanded(
                  flex: 13,
                  child: Container(
                    child: SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 30),
                        child: Column(
                          children: [
                            const Header(
                              title: 'Site Visit Report',
                              subTitle: '',
                            ),
                            SiteVistReportsList()
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
