import 'package:flutter/material.dart';

class NotificationsTextScreen extends StatelessWidget {
  const NotificationsTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
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
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Container(
          width: 368,
          height: 450,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Название',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Euismod pulvinar quis praesent id et pellentesque egestas id vitae. Fermentum gravida tristique enim tortor risus sed. Sem magna lobortis urna risus lacus sed varius sed nunc. Interdum id feugiat eget mi varius cursus. Viverra at pharetra ullamcorper ullamcorper nullam dui turpis. Convallis pellentesque sit dolor suscipit massa neque. Augue sollicitudin pulvinar sit pulvinar vitae tellus. Nulla tortor ut vestibulum lacus eu. Nec ut nisl nullam id.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
