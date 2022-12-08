import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';
import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/componets/sidebar.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/widgets/siteVistereportListLimt.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/widgets/streamBuilderUsersData.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/header.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/historyTable.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/componets/totalQuotationsList.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: Colors.white,
      key: _drawerKey,
      drawer: SizedBox(
          height: size.height,
          width: 300,
          child: const sidebar(
            select: 0,
          )),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor:
                  isDark ? Theme.of(context).cardColor : Colors.white,
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
                child: const sidebar(
                  select: 0,
                ),
              ),
            ),
          Expanded(
            flex: 9,
            child: Container(
              // color: Colors.blue,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(
                        title: 'Dashboard',
                        subTitle: '',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.spaceBetween,
                          children: const [
                            StremBuilderUsersData(
                              icon: LineIcons.userFriends,
                              label: 'Total Users\n',
                              steam: 'users',
                            ),
                            StremBuilderUsersData(
                              icon: LineIcons.fileInvoice,
                              label: 'Total Quote \nGenerated',
                              steam: 'quotations',
                            ),
                            StremBuilderUsersData(
                              icon: LineIcons.receipt,
                              label: 'Total Site \nSurvey Report',
                              steam: 'SiteSurveyReport',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Site Survey Report',
                            style: Theme.of(context).textTheme.headline2,
                            // TextStyle(
                            //     fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Daily Report',
                            style: Theme.of(context).textTheme.headline4,
                            //  TextStyle(
                            //     fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      // HistoryTable(),
                      SiteVistReportsListLimit(),
                      if (!Responsive.isDesktop(context)) PaymentDetailList()
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  decoration: BoxDecoration(
                      color:
                          //  Colors.white,
                          isDark ? Theme.of(context).cardColor : tsecondaryBg),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 25),
                    child: Column(
                      children: [
                        PaymentDetailList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      )),
    );
  }
}
