import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String userName;
  final String profilePictureUrl;

  const UserProfileScreen({
    super.key,
    required this.userName,
    this.profilePictureUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text(
                      'Miami',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    )
                  ],
                ),
                // VIP Host Section
                ListTile(
                  title: const Text('VIP Host',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                  subtitle: Text(userName,
                      style: const TextStyle(color: Colors.white70)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(profilePictureUrl),
                  ),
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.white),
                ),
                const SizedBox(height: 16),

                // Details Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800]),
                            child: const Text(
                              'Add Friend',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800]),
                            child: const Text('Friends',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800]),
                            child: const Text(
                              'Share Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Venues Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Venues',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 40, 39, 39)),
                            height: 150,
                            width: 130,
                            child: const Column(
                              children: [
                                Text(
                                  'Clubs',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 40, 39, 39)),
                            height: 150,
                            width: 130,
                            child: const Column(
                              children: [
                                Text(
                                  'Restaurants',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Need Help Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Need help?',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 8),
                      ListTile(
                        leading:
                            const Icon(Icons.chat_bubble, color: Colors.blue),
                        title: const Text('Chat',
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // Action Buttons
                Column(
                  children: [
                    ListTile(
                      title: const Text('Block',
                          style: TextStyle(color: Colors.red)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Report',
                          style: TextStyle(color: Colors.red)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Remove Friend',
                          style: TextStyle(color: Colors.red)),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
