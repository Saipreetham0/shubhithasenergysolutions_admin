import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';

CollectionReference ref =
    FirebaseFirestore.instance.collection('SiteSurveyReport');

class SiteVistReportsList extends StatelessWidget {
  List<DataRow> rows = [];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: ref.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final users = snapshot.data!.docs;

            rows = users
                .map((user) => DataRow(cells: [
                      DataCell(ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Text(user['Name']))),
                      DataCell(Text(user['PhoneNumber'].toString())),
                      DataCell(ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Text(user['Email']))),
                      DataCell(ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Text(user['Address'],
                              overflow: TextOverflow.ellipsis))),
                      DataCell(ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: Text(user['NameOfSiteBuilding']))),
                      // DataCell(ConstrainedBox(
                      //   constraints: const BoxConstraints(maxWidth: 250),
                      //   child: Text(
                      //       user['LiveLocationLat'] +
                      //           '  ' +
                      //           user['LiveLocationLong'],
                      //       overflow: TextOverflow.ellipsis),
                      // )),
                      // DataCell(
                      //     ConstrainedBox(
                      //       constraints: const BoxConstraints(maxWidth: 250),
                      //       child: Text(user['LiveLocation'],
                      //           overflow: TextOverflow.ellipsis),
                      //     ), onTap: () {

                      // }),
                      DataCell(IconButton(
                          onPressed: () {
                            Get.offAllNamed('/siteVisitReportDetails',
                                arguments: {
                                  'Name': user['Name'],
                                  'PhoneNumber': user['PhoneNumber'],
                                  'Email': user['Email'],
                                  'Address': user['Address'],
                                  'NameOfSiteBuilding':
                                      user['NameOfSiteBuilding'],
                                  'LiveLocationLat': user['LiveLocationLat'],
                                  'LiveLocationLong': user['LiveLocationLong'],
                                  'LiveLocation': user['LiveLocation'],
                                });
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp))),
                      DataCell(IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit))),

                      //  DataCell(Text(user['timestamp'])),
                    ]))
                .toList();

            return Container(
              color: isDark ? Theme.of(context).cardColor : Colors.white,
              child: DataTable(
                columnSpacing: 15.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                columns: [
                  DataColumn(
                    label: const Text("Name",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'name';
                      // });
                    },
                  ),
                  DataColumn(
                    label: const Text("Phone",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'phone';
                      // });
                    },
                  ),
                  DataColumn(
                    label: const Text("Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'email';
                      // });
                    },
                  ),
                  DataColumn(
                    label: const Text("Address",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'address';
                      // });
                    },
                  ),
                  DataColumn(
                    label: const Text("Name of Site/Building",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'role';
                      // });
                    },
                  ),
                  // DataColumn(
                  //   label: const Text("Latitude and Longitude",
                  //       style: TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.bold)),
                  //   onSort: (int columnIndex, bool ascending) {
                  //     // setState(() {
                  //     //   sortBy = 'role';
                  //     // });
                  //   },
                  // ),
                  // DataColumn(
                  //   label: const Text("Live Location",
                  //       style: TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.bold)),
                  //   onSort: (int columnIndex, bool ascending) {
                  //     // setState(() {
                  //     //   sortBy = 'role';
                  //     // });
                  //   },
                  // ),
                  const DataColumn(label: Text("")),
                  const DataColumn(label: Text("")),
                  // DataColumn(
                  //   label: Text("Timestamp",style: TextStyle(
                  // fontSize: 16, fontWeight: FontWeight.bold)),
                  //   onSort: (int columnIndex, bool ascending) {
                  //     // setState(() {
                  //     //   sortBy = 'role';
                  //     // });
                  //   },
                  // ),
                ],
                rows: rows,
              ),
            );
          },
        ),
      ]),
    );
  }
}
