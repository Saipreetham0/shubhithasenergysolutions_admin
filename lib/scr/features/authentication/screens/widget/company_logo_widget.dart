import 'package:flutter/material.dart';

class companyLogoWidget extends StatelessWidget {
  const companyLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image(
          alignment: Alignment.center,
          image:
              const AssetImage("assets/images/splash-screen/APP_LOGO_ROW.png"),
          height: size.height * 0.12,
          width: size.width * 0.12,
        ),
        SizedBox(height: size.height * 0.01),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'SHUBHITHA S',
                style: Theme.of(context).textTheme.headline1,
              ),
              TextSpan(
                text: ' ENERGY',
                // style: Theme.of(context).textTheme.headline1,
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontSize: 28,
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: '  SOLUTIONS',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
