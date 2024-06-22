import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDetailsScreen extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFEFEF),
        title: const Text(
          '   Банковской картой',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: screenWidth * 0.9,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFEE1F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/card.svg',
                          height: screenHeight * 0.03,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '1234   5678   9876   5432',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.03,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          ' NAME',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.015,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' Срок\n',
                                    style: TextStyle(
                                      color: const Color(0xFF2C2D31),
                                      fontSize: screenHeight * 0.013,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 12/24',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.018,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' CVC\n',
                                    style: TextStyle(
                                      color: const Color(0xFF2C2D31),
                                      fontSize: screenHeight * 0.013,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 6986',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.018,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: cardNumberController,
                  decoration: const InputDecoration(labelText: 'Номер карты'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: expiryController,
                  decoration: const InputDecoration(labelText: 'Срок'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: cvcController,
                  decoration: const InputDecoration(labelText: 'CVC'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(labelText: 'Сумма'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    _processTransaction(context);
                  },
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 61,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFFEE1F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Пополнить',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _processTransaction(BuildContext context) {
    bool isSuccess = (cardNumberController.text.isNotEmpty &&
        expiryController.text.isNotEmpty &&
        cvcController.text.isNotEmpty &&
        amountController.text.isNotEmpty);

    if (isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ErrorScreen()),
      );
    }
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Операция прошла успешно',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'В личный кабинет',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'Ошибка операции',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'В личный кабинет',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
