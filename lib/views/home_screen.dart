import 'package:flutter/material.dart';

import 'portal_screen.dart';
import 'user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            children: [
              const Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 21 / 14,
                  letterSpacing: 0.02,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.search,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(
                        userName: 'Supercool',
                      ), // Navigate to UserProfileScreen
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 15,
                  child: Icon(
                    Icons.person,
                    color: Color(0xffCCCCCC),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Portal",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.33,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TopList(),
                    const SizedBox(height: 40),
                    const Text(
                      "North America",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.33,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ScrollableListWithTitleAndButton(),
                    const SizedBox(height: 20),
                    const Text(
                      "Europe",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.33,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ScrollableListWithTitleAndButton(),
                    const SizedBox(height: 20),
                    const Text(
                      "Asia",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15.33,
                        fontWeight: FontWeight.w800,
                        height: 1.5,
                        letterSpacing: 0.02,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ScrollableListWithTitleAndButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth =
        MediaQuery.of(context).size.width; // Move context-dependent code here

    return SizedBox(
      height: 120, // Adjust height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TapToOpenButton(
            title: 'Portal',
            description: 'Invite your friends and follow existing members.',
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor:
                    Colors.transparent, // Makes the corners rounded
                isScrollControlled:
                    true, // Allows the bottom sheet to take more height
                builder: (BuildContext context) {
                  return PortalBottomSheet();
                },
              );
            },
            width: screenWidth * 0.9, // Use screenWidth here
          ),
          SizedBox(width: 20),
          TapToOpenButton(
            title: 'Tap to Open',
            description: 'Invite your friends and follow existing members.',
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor:
                    Colors.transparent, // Makes the corners rounded
                isScrollControlled:
                    true, // Allows the bottom sheet to take more height
                builder: (BuildContext context) {
                  return PortalBottomSheet();
                },
              );
            },
            width: screenWidth * 0.9, // Use screenWidth here
          ),
          // Add more buttons as needed
        ],
      ),
    );
  }
}

class TapToOpenButton extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final double width;

  const TapToOpenButton({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 103,
        decoration: BoxDecoration(
          color: const Color(0XFF1C1C1E),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 0.2),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                "assets/images/top.png",
                width: 50, // Adjust the width of the image if needed
                height: 50, // Adjust the height of the image if needed
                fit: BoxFit.cover, // Adjust image fitting
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollableListWithTitleAndButton extends StatelessWidget {
  const ScrollableListWithTitleAndButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 270, // Increased height to accommodate button and text
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CityCard(
                city: 'Miami',
                country: 'United States of America',
                members: '158 Members',
                imageUrl:
                    'assets/images/city1.png', // Ensure correct image path
              ),
              SizedBox(width: 10), // Space between cards
              CityCard(
                city: 'Ibiza',
                country: 'Spain',
                members: '158 Members',
                imageUrl: 'assets/images/city2.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CityCard extends StatelessWidget {
  final String city;
  final String country;
  final String members;
  final String imageUrl;

  const CityCard({
    Key? key,
    required this.city,
    required this.country,
    required this.members,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      margin: const EdgeInsets.only(right: 16), // Added margin for card spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 174.63,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      members,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Space between image and text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    country,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Join'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PortalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
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
            const Center(
              child: Text(
                'Portal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            PortalOption(
              icon: Icons.add,
              title: 'Bid Numbers',
              subtitle: 'Invite your friends',
            ),
            const SizedBox(height: 20),
            PortalOption(
              icon: Icons.qr_code,
              title: 'QR Code',
              subtitle: 'Share your profile',
            ),
            const SizedBox(height: 20),
            PortalOption(
              icon: Icons.scanner,
              title: 'Scanner',
              subtitle: 'Add existing members',
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child:
                    const Text('Done', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  textStyle: const TextStyle(fontSize: 18),
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
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
