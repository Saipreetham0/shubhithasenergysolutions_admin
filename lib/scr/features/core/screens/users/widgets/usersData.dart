import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

CollectionReference ref = FirebaseFirestore.instance.collection('users');

class usersData extends StatefulWidget {
  @override
  State<usersData> createState() => _usersDataState();
}

class _usersDataState extends State<usersData> {
  // const DataTable2SimpleDemo();
  List<DataRow> rows = [];

  String sortBy = 'name';

  String filterBy = 'name';

  String search = '';

  String dropdownvalue = 'user';

  var items = [
    'user',
    'admin',
    'employee',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Future customDilog(String role) {
    dropdownvalue = role;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Change User Role",
                style: Theme.of(context).textTheme.headlineMedium),
            content: DropdownButtonFormField(
              borderRadius: BorderRadius.circular(8),
              isExpanded: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownvalue = value.toString();
                });
              },
            ),
            actions: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                    )),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        DataCell(Text(user['name'])),
                        DataCell(Text(user['phone'].toString())),
                        DataCell(Text(user['email'])),
                        DataCell(Text(user['address'])),
                        DataCell(Text(user['role'])),
                        DataCell(
                          const Text(' '),
                          showEditIcon: true,
                          onTap: () {
                            customDilog(user['role'].toString());
                          },
                        ),
                      ]))
                  .toList();

              return Container(
                color: isDark ? Theme.of(context).cardColor : Colors.white,
                child: DataTable(
                  showBottomBorder: true,
                  headingRowHeight: 50,
                  columnSpacing: 30.0,
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
                      label: const Text("Role",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onSort: (int columnIndex, bool ascending) {
                        // setState(() {
                        //   sortBy = 'role';
                        // });
                      },
                    ),
                    DataColumn(
                      label: const Text("",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
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
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) {
          //       return CircularProgressIndicator();
          //     }
          //     List<DataRow> rowss = [];
          //     snapshot.data!.docs.forEach((doc) {
          //       rowss.add(
          //         DataRow(
          //           cells: [
          //             // Cells for each column here...
          //           ],
          //         ),
          //       );
          //     });
          //     return DataTable(
          //       columns: [
          //         // Columns here...
          //       ],
          //       rows: rows,
          //     );
          //   },
          // ),

          // listview bulder

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
          //                       text: "${docs['name']}  |  ",
          //                       style: TextStyle(
          //                           // color: Colors.yellow[700],
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w700),
          //                     ),
          //                     TextSpan(
          //                       text: "${docs['email']}",
          //                       style: Theme.of(context).textTheme.headline6,
          //                     ),
          //                     TextSpan(
          //                       text: " ( ${docs['phone']} )",
          //                       style: Theme.of(context).textTheme.headline6,
          //                     ),
          //                   ])),
          //                   subtitle: Text(
          //                     "${docs['role']}",
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
        ],
      ),
    );
  }
}
