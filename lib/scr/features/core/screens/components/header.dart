import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String subTitle;
  const Header({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
                // const TextStyle(
                //     color: Colors.black,
                //     fontSize: 30,
                //     fontWeight: FontWeight.w800),
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.headline2,
                //  const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w600),
              ),
            ]),
      ),
      const Spacer(
        flex: 1,
      ),
      // Expanded(
      //   flex: Responsive.isDesktop(context) ? 1 : 3,
      //   child: TextField(
      //     decoration: InputDecoration(
      //         filled: true,
      //         fillColor: Colors.white,
      //         contentPadding: EdgeInsets.only(left: 40.0, right: 5),
      //         enabledBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(30),
      //           borderSide: BorderSide(color: Colors.white),
      //         ),
      //         focusedBorder: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(30),
      //           borderSide: BorderSide(color: Colors.white),
      //         ),
      //         prefixIcon: Icon(Icons.search, color: Colors.black),
      //         hintText: 'Search',
      //         hintStyle: TextStyle(color: tsecondary, fontSize: 14)),
      //   ),
      // ),
    ]);
  }
}
