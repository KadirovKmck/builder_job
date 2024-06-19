import 'package:flutter/material.dart';

class CodeView extends StatefulWidget {
  const CodeView({super.key});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Code View",
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
