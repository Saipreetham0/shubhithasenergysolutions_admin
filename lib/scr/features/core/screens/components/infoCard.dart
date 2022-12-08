import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions_admin/scr/config/responsive.dart';

import 'package:shubhithasenergysolutions_admin/scr/config/size_config.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String amount;

  InfoCard({required this.icon, required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(
          minWidth: Responsive.isDesktop(context)
              ? 220
              : SizeConfig.screenWidth! / 2 - 40),
      padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
          right: Responsive.isMobile(context) ? 20 : 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? Theme.of(context).cardColor : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SvgPicture.asset(icon, width: 35),
          Icon(icon as IconData, size: 35),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.headline3,

            // const TextStyle(
            //     color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          // PrimaryText(text: label, color: AppColors.secondary, size: 16),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.headline3,
            // const TextStyle(
            //     color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
