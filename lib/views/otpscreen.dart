import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpControllers = List.generate(6, (index) => TextEditingController());
  final _focusNodes = List.generate(6, (index) => FocusNode());
  final _otp = List.generate(6, (index) => '');

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isEmpty) {
      // Move focus to previous field if the current field is cleared
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
      _otp[index] = '';
    } else if (value.length == 1) {
      // Move focus to the next field if the current field is filled
      _otp[index] = value;
      if (index < 5) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        // FocusScope.of(context).unfocus();
        _onSubmit();
      }
    }
  }

  void _onSubmit() {
    final otpCode = _otp.join();
    if (otpCode.length == 6) {
      // Handle OTP verification
      // For demonstration purposes, we'll just check if it's '123456'
      if (otpCode == '123456') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SuccessScreen()), // Navigate to the next screen
        );
      } else {
        _showAlertDialog('Invalid OTP',
            'The OTP you entered is incorrect. Please try again.');
      }
    } else {
      _showAlertDialog('Error', 'Please enter the 6-digit OTP.');
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    // Clear text fields when cancel is pressed

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'Enter the verification code sent to:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '+911234567891 or\nxyz@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 24),
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white30),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          filled: true,
                          fillColor: Colors.black,
                        ),
                        onChanged: (value) => _onChanged(value, index),
                        onEditingComplete: () {
                          // Handle focus shift on editing complete
                          if (_otpControllers[index].text.length == 0 &&
                              index > 0) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Handle resend OTP logic
                    print('Resend OTP');
                  },
                  child: const Text(
                    'Send a new code',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Text('OTP Verified Successfully!'),
      ),
    );
  }
}
