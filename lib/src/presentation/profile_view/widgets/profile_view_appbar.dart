import 'package:builder_job/src/components/navbar.dart';
import 'package:builder_job/src/presentation/payment%20_with_card_screen/card_details_screen/card_details_screen.dart';
import 'package:builder_job/src/presentation/payment%20_with_card_screen/card_of_phone_screen/card_of_phone_screen.dart';
import 'package:builder_job/src/presentation/profile_view/screen/notifications_screen/notifications_screen.dart';
import 'package:builder_job/src/presentation/profile_view/screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileViewAppBar extends StatelessWidget {
  final double width;
  final double height;

  const ProfileViewAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 375.0;
    double baseHeight = 667.0;

    double scaleFactorWidth = screenWidth / baseWidth;
    double scaleFactorHeight = screenHeight / baseHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavbarView(),
                ));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage('assets/images/user.png'),
                      radius: 35 * scaleFactorWidth,
                    ),
                    SizedBox(width: 10 * scaleFactorWidth),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Легов Михаил Иванович',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18 * scaleFactorWidth,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Специалист',
                          style: TextStyle(
                            color: const Color(0xFF504F4F),
                            fontSize: 15 * scaleFactorWidth,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 18 * scaleFactorWidth),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: 27 * scaleFactorWidth,
                  height: 27 * scaleFactorWidth,
                  child: Stack(
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 6.48 * scaleFactorWidth,
                          height: 6.48 * scaleFactorWidth,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFF54135),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg'),
              SizedBox(width: 5 * scaleFactorWidth),
              Text(
                'Астана',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18 * scaleFactorWidth,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
          child: Row(
            children: [
              Text(
                '100000 ₸',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18 * scaleFactorWidth,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 22 * scaleFactorWidth),
              GestureDetector(
                onTap: () {
                  _showTopUpDialog(context, scaleFactorWidth);
                },
                child: Container(
                  width: 129 * scaleFactorWidth,
                  height: 29 * scaleFactorHeight,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Пополнить',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16 * scaleFactorWidth,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showTopUpDialog(BuildContext context, double scaleFactorWidth) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 296,
          width: 357,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Способ пополнения',
                  style: TextStyle(
                    fontSize: 18 * scaleFactorWidth,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.credit_card, color: Colors.yellow),
                  title: const Text(
                    'Банковской картой',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardDetailsScreen(),
                        ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.yellow),
                  title: const Text(
                    'По номеру телефона',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardOfPhoneScreen(),
                        ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
