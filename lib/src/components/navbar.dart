import 'package:builder_job/src/presentation/home_view/home_view.dart';
import 'package:builder_job/src/presentation/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _currentIndex = 1;
  List<Widget> views = [
    const SizedBox(),
    const HomeView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: views[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: _currentIndex != 2
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: const Color(0xFFDD6F31),
              unselectedItemColor: Colors.black,
              onTap: (value) => setState(() {
                _currentIndex = value;
              }),
              selectedLabelStyle: const TextStyle(
                color: Color(0xFFDD6F31),
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/star.svg',
                    height: height * 0.035,
                  ),
                  label: 'Избранное',
                  activeIcon: SvgPicture.asset(
                    'assets/icons/star.svg',
                    height: height * 0.035,
                    color: const Color(0xFFDD6F31),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: width * 0.13,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEE1F),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: height * 0.035,
                  ),
                  label: 'Домой',
                  activeIcon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: height * 0.035,
                    color: const Color(0xFFDD6F31),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
