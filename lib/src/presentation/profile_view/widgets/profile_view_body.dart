import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.62,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/bag.svg'),
                    const Text(
                      'Добавить организацию',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
                SizedBox(
                  height: height * 0.033,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/icons/bookmark.png'),
                    const Text(
                      'Избранное',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
                SizedBox(
                  height: height * 0.033,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/logout.svg'),
                    const Text(
                      'Выйти',
                      style: TextStyle(
                        color: Color(0xFFEC4E4E),
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color(0xFFEC4E4E),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
