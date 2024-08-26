import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;

  const ChatScreen(this.name, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isTyping = _controller.text.isNotEmpty;
      });
    });
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'sender': 'You',
          'timestamp':
              DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5),
        });
        _controller.clear();
        _isTyping = false; // Hide send button after sending message
      });
    }
  }

  void _startRecording() {
    // Handle recording functionality here
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(221, 50, 49, 49),
          elevation: 0,
          title: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(
                  widget.name[0],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.name,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flag_outlined),
              color: Colors.blueAccent,
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - index - 1];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Align(
                      alignment: message['sender'] == 'You'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width *
                              0.75, // Adjust the width as needed
                        ),
                        decoration: BoxDecoration(
                          color: message['sender'] == 'You'
                              ? Colors.blue[100]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: message['sender'] == 'You'
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 100,
              color: const Color.fromARGB(221, 50, 49, 49),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              CupertinoIcons.waveform,
                              color: Colors.redAccent,
                              size: 30,
                            ),
                            onPressed: _startRecording,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isTyping,
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white70),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
