import 'package:flutter/material.dart';

class PortalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Portal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black, // Ensure the app bar remains black
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent, // Makes the corners rounded
              isScrollControlled:
                  true, // Allows the bottom sheet to take more height
              builder: (BuildContext context) {
                return PortalBottomSheet();
              },
            );
          },
          child: Text('Open Portal'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class PortalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        color: Colors.grey[850], // Grey background
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes the minimum height
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  "assets/images/top.png",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
            PortalOption(
              icon: Icons.add,
              title: 'Bid Numbers',
              subtitle: 'Invite your friends',
            ),
            SizedBox(height: 20),
            PortalOption(
              icon: Icons.qr_code,
              title: 'QR Code',
              subtitle: 'Share your profile',
            ),
            SizedBox(height: 20),
            PortalOption(
              icon: Icons.scanner,
              title: 'Scanner',
              subtitle: 'Add existing members',
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortalOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  PortalOption({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 30),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
            Text(subtitle, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
