import 'package:builder_job/src/presentation/profile_view/screen/notifications_screen/notifications_text_screen/notifications_text_screen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFEFEF),
        title: Text(
          'Уведомления',
          style: TextStyle(
            fontSize: 24 * textScale,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: const Color(0xFFEFEFEF),
        padding: EdgeInsets.all(width * 0.05),
        child: ListView(
          children: [
            _buildNotificationCard(
              context: context,
              title: 'Название',
              text: 'Текст уведомления',
              textScale: textScale,
            ),
            SizedBox(height: height * 0.02),
            _buildNotificationCard(
              context: context,
              title: 'Название',
              text: 'Текст уведомления',
              textScale: textScale,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required BuildContext context,
    required String title,
    required String text,
    required double textScale,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsTextScreen(),
            ));
      },
      borderRadius: BorderRadius.circular(12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(16.0 * textScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18 * textScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8 * textScale),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16 * textScale,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
