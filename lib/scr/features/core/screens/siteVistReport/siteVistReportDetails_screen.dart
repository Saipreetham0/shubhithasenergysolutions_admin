import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/Dashboard/componets/sidebar.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/header.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/siteVistReport/widgets/map.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/siteVistReport/widgets/sitevisitReportsList.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class siteVistReportDetails extends StatefulWidget {
  const siteVistReportDetails({super.key});

  @override
  State<siteVistReportDetails> createState() => _siteVistReportDetailsState();
}

class _siteVistReportDetailsState extends State<siteVistReportDetails> {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Header(
                              title: 'Site Visit Report Details',
                              subTitle: '',
                            ),
                            const SizedBox(height: 30),
                            const SizedBox(height: 30),
                            ReportsDetails(),
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

class ReportsDetails extends StatelessWidget {
  Future<void> _openMap(String lat, String long) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not launch $googleUrl';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectableText.rich(TextSpan(
              text: 'Name: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['Name']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),
            SelectableText.rich(TextSpan(
              text: 'Phone Number: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['PhoneNumber']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),
            SelectableText.rich(TextSpan(
              text: 'Email: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['Email']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),
            SelectableText.rich(TextSpan(
              text: 'Address: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['Address']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),

            SelectableText.rich(TextSpan(
              text: 'Name of Site Building: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['NameOfSiteBuilding']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),

            SelectableText.rich(TextSpan(
              text: 'Lat: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['LiveLocationLat']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),

            SelectableText.rich(TextSpan(
              text: 'Long: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['LiveLocationLong']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),

            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    _openMap('${Get.arguments['LiveLocationLat']}',
                        '${Get.arguments['LiveLocationLong']}');
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('View Location')),
            ),
            const SizedBox(height: 10),

            SelectableText.rich(TextSpan(
              text: 'Live Location: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['LiveLocation']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            const SizedBox(height: 10),

            SelectableText.rich(TextSpan(
              text: 'Site Visit Date: ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: '${Get.arguments['SiteVisitDate']}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal)),
              ],
            )),
            // Text('Name: ${Get.arguments['Name']}',
            //     style:
            //         const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // Text('Phone Number: ${Get.arguments['PhoneNumber']}',
            //     style:
            //         const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // Text('Email: ${Get.arguments['Email']}'),
            // Text('Address: ${Get.arguments['Address']}'),
            // Text(
            //     'Name of Site Building: ${Get.arguments['NameOfSiteBuilding']}'),
            // Text('Lat: ${Get.arguments['LiveLocationLat']}'),
            // Text('long: ${Get.arguments['LiveLocationLong']}'),
            // Text('Live location: ${Get.arguments['LiveLocation']}'),
          ],
        ),
        // Row(
        //   children: [
        //     // Text('Site Visit Date: ${Get.arguments['SiteVisitDate']}'),
        //     // Text('Site Visit Time: ${Get.arguments['SiteVisitTime']}'),
        //     map()
        //   ],
        // ),

        // getMap()
      ],
    );
  }
}
