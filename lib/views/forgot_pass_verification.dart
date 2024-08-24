import 'package:access_is_king/views/bid_number.dart';
import 'package:access_is_king/views/home_screen.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  VerificationScreen({required this.email});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final String _correctOtp = '123456'; // Define the correct OTP here

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onOtpEntered() {
    final enteredOtp = _controllers.map((controller) => controller.text).join();
    if (enteredOtp == _correctOtp) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecurityPinPage()),
      );
    } else {
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text(
            'Invalid OTP',
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            'The OTP you entered is incorrect. Please try again.',
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
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
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
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            const Text(
              'Enter the Verification code sent to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.email,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            _buildOtpFields(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return _buildOtpTextField(context, index);
      }),
    );
  }

  Widget _buildOtpTextField(BuildContext context, int index) {
    return SizedBox(
      width: 45,
      child: TextFormField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 5) {
              FocusScope.of(context).nextFocus(); // Move to next field
            } else {
              _onOtpEntered(); // All fields filled, check OTP
            }
          } else if (value.isEmpty) {
            if (index > 0) {
              FocusScope.of(context).previousFocus(); // Move to previous field
            }
          }
        },
        onFieldSubmitted: (_) {
          if (index == 5) {
            _onOtpEntered(); // All fields filled, check OTP
          }
        },
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: Center(
        child: const Text('You have successfully verified your email!'),
      ),
    );
  }
}
