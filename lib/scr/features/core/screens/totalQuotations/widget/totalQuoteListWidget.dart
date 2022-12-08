import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';

CollectionReference ref = FirebaseFirestore.instance.collection('quotations');

class totalQuoteList extends StatelessWidget {
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
            // print(users);
            rows = users
                .map((user) => DataRow(cells: [
                      DataCell(Text(
                        user['name'],
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      DataCell(Text(
                        user['phoneNumber'].toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      DataCell(Text(
                        user['address'],
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      DataCell(Text(
                        user['kW'],
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      DataCell(Text(
                        user['solartype'],
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                      DataCell(Text(
                        user['timestamp'],
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                    ]))
                .toList();

            return Container(
              color: isDark ? Theme.of(context).cardColor : Colors.white,
              child: DataTable(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                columns: [
                  DataColumn(
                    label: Text("Name",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'name';
                      // });
                    },
                  ),
                  DataColumn(
                    label: Text("Phone",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'phone';
                      // });
                    },
                  ),
                  DataColumn(
                    label: Text("Address",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'email';
                      // });
                    },
                  ),
                  DataColumn(
                    label: Text("kW",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'address';
                      // });
                    },
                  ),
                  DataColumn(
                    label: Text("Commercial / Domestic",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'role';
                      // });
                    },
                  ),
                  DataColumn(
                    label: Text("Timestamp",
                        style: Theme.of(context).textTheme.headline4),
                    onSort: (int columnIndex, bool ascending) {
                      // setState(() {
                      //   sortBy = 'role';
                      // });
                    },
                  ),
                ],
                rows: rows,
              ),
            );
          },
        ),
        // StreamBuilder(
        //   stream: ref.snapshots(),
        //   builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasData) {
        //       return SingleChildScrollView(
        //         child: ListView.builder(
        //             physics: const NeverScrollableScrollPhysics(),
        //             itemCount: snapshot.data!.docs.length,
        //             shrinkWrap: true,
        //             itemBuilder: (context, index) {
        //               var docs = snapshot.data!.docs[index];

        //               return Card(
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(8.0),
        //                 ),
        //                 elevation: 2,
        //                 child: ListTile(
        //                   onTap: () {},
        //                   title: RichText(
        //                       text: TextSpan(children: [
        //                     TextSpan(
        //                       text: "${docs['kW']}",
        //                       style: TextStyle(
        //                           color: Colors.yellow[700],
        //                           fontSize: 15,
        //                           fontWeight: FontWeight.w700),
        //                     ),
        //                     TextSpan(
        //                         text: " KWh",
        //                         style: Theme.of(context).textTheme.headline6),
        //                     const TextSpan(
        //                       text: " | ",
        //                       // style: Theme.of(context).textTheme.bodyText1,
        //                     ),
        //                     TextSpan(
        //                       text: "${docs['solartype']}",
        //                       style: Theme.of(context).textTheme.headline6,
        //                     ),
        //                     TextSpan(
        //                       text:
        //                           " ( ${docs['name']} ) |  ${docs['phoneNumber']}",
        //                       style: Theme.of(context).textTheme.headline6,
        //                     ),
        //                   ])),
        //                   leading: Image.asset(
        //                       'assets/images/pdfListView/${docs['solartype']}.png',
        //                       height: 30),
        //                   subtitle: Text(
        //                     "${docs['timestamp']}",
        //                     style: Theme.of(context).textTheme.subtitle1,
        //                   ),
        //                 ),
        //               );
        //             }),
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // )
      ]),
    );
  }
}
