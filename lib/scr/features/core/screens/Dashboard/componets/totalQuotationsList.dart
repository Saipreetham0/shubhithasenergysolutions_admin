import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';

CollectionReference ref = FirebaseFirestore.instance.collection('quotations');

class PaymentDetailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Generated Quotations',
            style: Theme.of(context).textTheme.headline3,

          ),
          Text(
            'View all',
            style: Theme.of(context).textTheme.headline5,

          ),
        ],
      ),

      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),

    

      StreamBuilder(
        stream: ref.limit(8).snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var docs = snapshot.data!.docs[index];

                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2,
                      child: ListTile(
                        onTap: () {},
                        title: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "${docs['kW']}",
                            style: TextStyle(
                                color: Colors.yellow[700],
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                              text: " KWh",
                              style: Theme.of(context).textTheme.headline6),
                          const TextSpan(
                            text: " | ",
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: "${docs['solartype']}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextSpan(
                            text: " ( ${docs['name']} )",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ])),
                        leading: Image.asset(
                            'assets/images/pdfListView/${docs['solartype']}.png',
                            height: 30),
                        subtitle: Text(
                          "${docs['timestamp']}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    ]);
  }
}
