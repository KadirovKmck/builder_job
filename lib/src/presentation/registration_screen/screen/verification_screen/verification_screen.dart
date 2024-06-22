import 'package:builder_job/src/components/navbar.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();
  String _errorText = '';
  final int _codeLength = 4;

  final String _correctCode = '1234';

  void _validateCode() {
    if (_codeController.text == _correctCode) {
      setState(() {
        _errorText = '';
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavbarView()),
      );
    } else {
      setState(() {
        _errorText = 'Неверный код';
      });
    }
  }

  void _resendCode() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Код отправлен повторно')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    double circleSize = width / (_codeLength * 2.5);
    double fontSize = 24.0 * textScale;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Введите код',
                style: TextStyle(fontSize: 24.0 * textScale),
              ),
              SizedBox(height: height * 0.02),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _showKeyboard(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _codeLength,
                    (index) => _buildCircle(
                      index < _codeController.text.length
                          ? _codeController.text[index]
                          : '',
                      circleSize,
                      fontSize,
                      _getColorForIndex(index),
                    ),
                  ),
                ),
              ),
              if (_errorText.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    _errorText,
                    style: TextStyle(
                        color: Colors.red, fontSize: 16.0 * textScale),
                  ),
                ),
              SizedBox(height: height * 0.08),
              ElevatedButton(
                onPressed: _validateCode,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  minimumSize: Size(double.infinity, height * 0.08),
                ),
                child: const Text(
                  'Далее',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              TextButton(
                onPressed: _resendCode,
                child: Text(
                  'Выслать SMS повторно',
                  style: TextStyle(
                      color: Colors.yellow, fontSize: 16.0 * textScale),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorForIndex(int index) {
    if (index < _codeController.text.length) {
      return _codeController.text[index] == _correctCode[index]
          ? Colors.green
          : Colors.red;
    }
    return Colors.grey[300]!;
  }

  Widget _buildCircle(String digit, double size, double fontSize, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Text(
        digit,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  void _showKeyboard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            color: Colors.black87,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _codeController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  maxLength: _codeLength,
                  onChanged: (text) {
                    setState(() {
                      _errorText = '';
                    });

                    if (text.length > _codeLength) {
                      _codeController.text = text.substring(0, _codeLength);
                      _codeController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _codeLength));
                    }
                    setState(() {});
                  },
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0 * MediaQuery.of(context).textScaleFactor,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    hintText: '',
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.yellow,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                ElevatedButton(
                  onPressed: () {
                    _validateCode();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                  child: Text('Далее',
                      style: TextStyle(
                          fontSize:
                              18.0 * MediaQuery.of(context).textScaleFactor)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
