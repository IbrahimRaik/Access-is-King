import 'package:flutter/material.dart';

import 'user_profile_screen.dart';

class GroupDetailsScreen extends StatelessWidget {
  final String groupName;
  final List<String> members;

  const GroupDetailsScreen({
    required this.groupName,
    required this.members,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                groupName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              // const Card(
              //   margin: EdgeInsets.all(15),
              //   child: Row(
              //     children: [
              //       CircleAvatar(),
              //       Column(
              //         children: [],
              //       ),
              //     ],
              //   ),
              // ),
              const Text(
                'Online',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 67, 63, 63),
                              borderRadius: index == 0
                                  ? const BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    )
                                  : BorderRadius.zero,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: Text(
                                    members[index][0],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    // Navigate to the UserProfileScreen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserProfileScreen(
                                          userName: members[index],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 25,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                title: Text(
                                  members[index],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.1,
                          height: 0.9,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
