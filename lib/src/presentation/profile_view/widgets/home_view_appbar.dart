import 'package:flutter/material.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          child: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 35,
              ),
              Column(
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
              Svg
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$ 7,924.20',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                padding: EdgeInsets.all(width * 0.02),
                height: height * 0.05,
                width: width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/icons/5.1.png'),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: const Row(
            children: [
              Text(
                '+162% all time ',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
