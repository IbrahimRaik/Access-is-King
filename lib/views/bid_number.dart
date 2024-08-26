import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/reusable_pinput.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class SecurityPinPage extends StatelessWidget {
  const SecurityPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          automaticallyImplyLeading: false, // This removes the back arrow
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    height: 21 / 14,
                    letterSpacing: 0.02,
                    color: Colors.blue,
                  ),
                ),
              ),
              const Text(
                'Access is King',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  height: 22.5 / 15,
                  letterSpacing: 0.02,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 60), // Space to balance the row
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Enter a valid BID number to join:',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Invite Only',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              ReusablePinput(
                length: 6,
                onCompleted: (pin) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Member login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    final focusNode = FocusNode();
    return KeyboardActionsConfig(
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              );
            },
          ],
        ),
      ],
    );
  }
}
