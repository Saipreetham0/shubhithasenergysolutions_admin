// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:line_icons/line_icons.dart';
// import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';
// import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';
// import 'package:shubhithasenergysolutions_admin/scr/constants/colors.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/authentication/controllers/auth_controller.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/appBarActionItems.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/header.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/infoCard.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/paymentDetailList.dart';
// import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/sidemenu.dart';

// import 'components/historyTable.dart';

// class dashBoard extends StatefulWidget {
//   @override
//   State<dashBoard> createState() => _dashBoardState();

//   static String tag = '/dashboard';
// }

// final db = FirebaseFirestore.instance;
// final user = AuthController.instance.user;
// final currentUser = FirebaseAuth.instance.currentUser;

// var totalQuote;
// var totalSiteSurveyReport;
// var totalUsers;

// class _dashBoardState extends State<dashBoard> {
//   GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//   Future getData() async {
//     var quotations = db.collection('quotations').snapshots();
//     quotations.listen((event) {
//       setState(() {
//         totalQuote = event.docs.length;
//       });
//     });

//     var SiteSurveyReport = db.collection('SiteSurveyReport').snapshots();
//     SiteSurveyReport.listen((event) {
//       setState(() {
//         totalSiteSurveyReport = event.docs.length;
//       });
//     });

//     var TotalUsers = db.collection('users').snapshots();
//     TotalUsers.listen((event) {
//       setState(() {
//         totalUsers = event.docs.length;
//       });
//     });
//   }

//   @override
//   initState() {
//     getData();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     SizeConfig().init(context);

//     return Scaffold(
//       key: _drawerKey,
//       drawer: SizedBox(width: 100, child: SideMenu()),
//       appBar: !Responsive.isDesktop(context)
//           ? AppBar(
//               elevation: 0,
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                   onPressed: () {
//                     _drawerKey.currentState?.openDrawer();
//                   },
//                   icon: const Icon(Icons.menu, color: Colors.black)),
//               actions: [
//                 AppBarActionItems(),
//               ],
//             )
//           : const PreferredSize(
//               preferredSize: Size.zero,
//               child: SizedBox(),
//             ),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 flex: 1,
//                 child: SideMenu(),
//               ),
//             Expanded(
//                 flex: 10,
//                 child: SafeArea(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 30, horizontal: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Header(),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         SizedBox(
//                           width: SizeConfig.screenWidth,
//                           child: Wrap(
//                             spacing: 20,
//                             runSpacing: 20,
//                             alignment: WrapAlignment.spaceBetween,
//                             children: [
//                               InfoCard(
//                                   icon: LineIcons.userFriends,
//                                   label: 'Total Users \n',
//                                   amount: '$totalUsers'),
//                               InfoCard(
//                                   icon: LineIcons.fileInvoice,
//                                   label: 'Total Quote \nGenerated ',
//                                   amount: '$totalQuote'),
//                               InfoCard(
//                                   icon: LineIcons.receipt,
//                                   label: 'Total Site \nSurvey Report',
//                                   amount: '$totalSiteSurveyReport'),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: SizeConfig.blockSizeVertical! * 5,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Site Survey Report',
//                               style: TextStyle(
//                                   fontSize: 25, fontWeight: FontWeight.w800),
//                             ),
//                             Text(
//                               'Daily Report',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w400),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: SizeConfig.blockSizeVertical! * 3,
//                         ),
//                         HistoryTable(),
//                         if (!Responsive.isDesktop(context)) PaymentDetailList()
//                       ],
//                     ),
//                   ),
//                 )),
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 flex: 4,
//                 child: SafeArea(
//                   child: Container(
//                     // color: Colors.red,
//                     width: double.infinity,
//                     height: SizeConfig.screenHeight,
//                     decoration: const BoxDecoration(color: tsecondaryBg),
//                     child: SingleChildScrollView(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 30, horizontal: 30),
//                       child: Column(
//                         children: [
//                           AppBarActionItems(),
//                           // PaymentDetailList(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
