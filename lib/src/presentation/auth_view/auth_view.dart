import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.1),
            Image.asset('assets/images/logoHorizontal.png',
                height: height * 0.1),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
                const Text(
                  'Вход',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const LogoWidget(),
            SizedBox(height: height * 0.05),
            const RegistrationForm(),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: () {
                // Handle the registration logic here
              },
              style: ElevatedButton.styleFrom(
                // primary: Colors.yellow,
                // onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                minimumSize: Size(double.infinity, height * 0.08),
              ),
              child: const Text('Далее'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Image.asset(
          'assets/images/logoHorizontal.png',
          height: height * 0.3,
          width: width * 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  const Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Container(
                    height: 2.0,
                    width: 60.0,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(width: height * 0.05),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Вход',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
          style: TextStyle(fontSize: height * 0.02),
        ),
        SizedBox(height: height * 0.02),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Пароль',
            suffixIcon: Icon(Icons.visibility_off),
          ),
          obscureText: true,
          style: TextStyle(fontSize: height * 0.02),
        ),
        SizedBox(height: height * 0.02),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Номер телефона',
          ),
          style: TextStyle(fontSize: height * 0.02),
        ),
        SizedBox(height: height * 0.02),
        // DropdownButtonFormField<String>(
        //   items: [
        //     DropdownMenuItem(
        //       child: Text('Ваш статус'),
        //       value: '',
        //     ),
        //     // Add other dropdown items here
        //   ],
        //   onChanged: (value) {},
        //   decoration: InputDecoration(
        //     hintText: 'Ваш статус',
        //   ),
        // ),
      ],
    );
  }
}
