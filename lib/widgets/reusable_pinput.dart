import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../views/bottom_navigation_bar.dart';

class ReusablePinput extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;

  const ReusablePinput({
    Key? key,
    required this.length,
    required this.onCompleted,
  }) : super(key: key);

  @override
  _ReusablePinputState createState() => _ReusablePinputState();
}

class _ReusablePinputState extends State<ReusablePinput> {
  String enteredPin = ''; // To store the entered PIN
  int attemptCounter = 0;
  bool isLocked = false;

  @override
  Widget build(BuildContext context) {
    // Default PIN theme with grey color
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade600, width: 2),
        ),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );

    // Focused PIN theme (for the currently active PIN field)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );

    // Submitted PIN theme (for already completed PINs)
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Pinput(
          length: widget.length,
          enabled: !isLocked,
          onCompleted: (pin) {
            setState(() {
              enteredPin = pin; // Update the entered PIN
            });
            if (_validatePin(pin)) {
              widget.onCompleted(pin); // Call the callback on success
              _showSuccessAlert(context);
            } else {
              _handleFailedAttempt(context);
            }
          },
          keyboardType: TextInputType.number, // Show numeric keyboard
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
        ),
        const SizedBox(height: 16), // Add some spacing
        const Text(
          "member login",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.blue, // Color of the text
          ),
        ),
      ],
    );
  }

  bool _validatePin(String pin) {
    // Replace this with your actual PIN validation logic
    return pin == "123456";
  }

  void _handleFailedAttempt(BuildContext context) {
    setState(() {
      attemptCounter++;
      if (attemptCounter >= 3) {
        isLocked = true;
        attemptCounter = 0;
        _showMaxAttemptsAlert(context);
        Future.delayed(const Duration(seconds: 30), () {
          setState(() {
            isLocked = false;
          });
        });
      } else {
        _showInvalidPinAlert(context);
      }
    });
  }

  void _showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _customAlertDialog(
          context,
          const Text("Success"),
          const Text("You have successfully logged in."),
          onDismissed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
            );
          },
        );
      },
    );
  }

  void _showInvalidPinAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _customAlertDialog(
          context,
          const Text("Invalid PIN"),
          const Text("The entered PIN is invalid. Please try again."),
        );
      },
    );
  }

  void _showMaxAttemptsAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _customAlertDialog(
          context,
          const Text("Maximum Attempts Reached"),
          const Text(
              "You have reached the maximum number of attempts. Please wait 30 seconds before trying again."),
        );
      },
    );
  }

  Widget _customAlertDialog(BuildContext context, Widget title, Widget content,
      {VoidCallback? onDismissed}) {
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: const Color(0xFF3D3C3F),
      ),
      child: AlertDialog(
        title: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: title,
        ),
        content: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: content,
        ),
        actions: [
          TextButton(
            child: const Text(
              "OK",
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (onDismissed != null) {
                onDismissed();
              }
            },
          ),
        ],
      ),
    );
  }
}
