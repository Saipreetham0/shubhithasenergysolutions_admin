import 'package:flutter/material.dart';

class AppBarActionItems extends StatelessWidget {
  // const AppBarActionItems({
  //   required Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Colors.black,
            ),
            onPressed: () {}),
        const SizedBox(width: 10),
        IconButton(
            // icon: SvgPicture.asset('assets/ring.svg', width: 20.0),
            icon: const Icon(
              Icons.notifications_active_outlined,
            ),
            onPressed: () {}),
        const SizedBox(width: 15),
        Row(children: const [
          CircleAvatar(
            radius: 17,
            backgroundImage: NetworkImage(
              'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
            ),
          ),
          Icon(Icons.arrow_drop_down_outlined, color: Colors.black)
        ]),
      ],
    );
  }
}
