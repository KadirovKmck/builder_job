import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 375.0;
    double baseHeight = 667.0;

    double scaleFactorWidth = screenWidth / baseWidth;
    double scaleFactorHeight = screenHeight / baseHeight;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 206, 206),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 206, 206, 206),
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/user.png'),
              radius: 45 * scaleFactorWidth,
            ),
            SizedBox(height: 10 * scaleFactorHeight),
            Text(
              'Легов Михаил Иванович',
              style: TextStyle(
                fontSize: 20 * scaleFactorWidth,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8 * scaleFactorHeight),
            Text(
              'Специалист',
              style: TextStyle(
                fontSize: 14 * scaleFactorWidth,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32 * scaleFactorHeight),
            ProfileDetailField(
                label: 'Легов Михаил Иванович', scaleFactor: scaleFactorWidth),
            SizedBox(height: 16 * scaleFactorHeight),
            ProfileDetailField(
                label: 'Legov@gmail.com', scaleFactor: scaleFactorWidth),
            SizedBox(height: 16 * scaleFactorHeight),
            ProfileDetailField(
                label: '+7 727 157 14 81', scaleFactor: scaleFactorWidth),
          ],
        ),
      ),
    );
  }
}

class ProfileDetailField extends StatelessWidget {
  final String label;
  final double scaleFactor;

  const ProfileDetailField(
      {super.key, required this.label, required this.scaleFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(
          vertical: 19 * scaleFactor, horizontal: 16 * scaleFactor),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30 * scaleFactor),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16 * scaleFactor),
      ),
    );
  }
}
