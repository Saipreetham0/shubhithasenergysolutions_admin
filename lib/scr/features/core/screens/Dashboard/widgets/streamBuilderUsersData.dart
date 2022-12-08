import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions_admin/scr/features/core/screens/components/infoCard.dart';

final db = FirebaseFirestore.instance;

class StremBuilderUsersData extends StatelessWidget {
  final String steam;
  final String label;
  final IconData icon;
  const StremBuilderUsersData({
    super.key,
    required this.steam,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection('$steam').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final streamLength = snapshot.data?.docs.length;
            return InfoCard(icon: icon, label: label, amount: '$streamLength');
          } else {
            return Container();
          }
        });
  }
}
