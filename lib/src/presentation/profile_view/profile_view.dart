import 'package:builder_job/src/presentation/profile_view/widgets/profile_view_appbar.dart';
import 'package:builder_job/src/presentation/profile_view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xffFFEE1F),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ProfileViewAppBar(width: width, height: height),
          SizedBox(
            height: height * 0.04,
          ),
          ProfileViewBody(height: height, width: width),
        ],
      ),
    );
  }
}
