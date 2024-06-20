import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewAppBar extends StatelessWidget {
  const ProfileViewAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 35,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Легов Михаил Иванович',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Специалист',
                        style: TextStyle(
                          color: Color(0xFF504F4F),
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 27,
                height: 27,
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/icons/notification.svg'),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6.48,
                        height: 6.48,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFF54135),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg'),
              const Text(
                'Астана',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Row(
            children: [
              const Text(
                '100000 ₸',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(width: 22),
              Container(
                width: 129,
                height: 29,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Пополнить',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
