import 'package:flutter/material.dart';

import 'src/presentation/wellcome_view/wellcome_view.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WellcomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
