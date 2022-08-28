import 'package:flutter/material.dart';
import 'package:messenger/screens/friends_screen.dart';
import 'package:messenger/screens/messenger_screen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final List<String> names = <String>["Emma Sher", "Dylan Carr", "Micca Tesh", "Marsha K", "Kelly Foster", "Tilly"];
  final List<String> photos = <String>["image_1.png", "image_2.png", "image_3.png", "image_4.png", "image_5.png", "image_6.png"];
  final List<String> times = <String>["4:20 PM", "1:42 PM", "11:04 AM", "11:01 AM", "9:30 AM", "9:28 AM"];
  final List<String> messages = <String>[
    "Hey gurl!",
    "U free tonight for chem study?",
    "I’ll message you ltr",
    "k :)",
    "Only coming back on Tuesday so no stress",
    "Yip yip, but don’t forget about tonight"
  ];
  final List<int> notifications = <int>[2, 1, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 240, 240, 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromRGBO(80, 80, 80, 1.0),
                            ),
                          ),
                          const Text(
                            "Search",
                            style: TextStyle(
                              color: Color.fromRGBO(80, 80, 80, 1.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 18,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FriendsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    splashRadius: 18,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Column(
                children: [
                  for (int i = 0; i < names.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MessengerScreen(
                              name: names[i],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 50,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 25,
                              child: Image(
                                image: AssetImage(
                                  photos[i],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50 - 50 - 18,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        names[i],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        times[i],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50 - 50 - 18,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        messages[i],
                                      ),
                                      notifications[i] > 0
                                          ? CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 9,
                                              child: Text(
                                                notifications[i].toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
