import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredChatData = chatData;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterChats);
  }

  void _filterChats() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredChatData = chatData.where((chat) {
        return chat['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle edit action
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.square_pencil_fill,
                        color: Colors.blue),
                    onPressed: () {
                      // Handle new chat action
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Chat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Search bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredChatData.length,
                itemBuilder: (context, index) {
                  final chat = _filteredChatData[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text(
                        chat['name']![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      chat['name']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      chat['message']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      chat['time']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Navigate to individual chat screen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(chat['name']!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

final List<Map<String, String>> chatData = [
  {
    'name': 'John Doe',
    'message': 'Hey, how are you?',
    'time': '12:30 PM',
  },
  {
    'name': 'Jane Smith',
    'message': 'Let’s meet tomorrow.',
    'time': '11:45 AM',
  },
  {
    'name': 'Alex Johnson',
    'message': 'Got it, thanks!',
    'time': '10:00 AM',
  },
  {
    'name': 'Emily Davis',
    'message': 'See you soon.',
    'time': '9:30 AM',
  },
];
