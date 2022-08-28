import 'package:flutter/material.dart';

import '../models/message_model.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  final ScrollController _controller = ScrollController();
  List<String> emojis = ["heart.png", "ok.png", "happy.png", "sad.png", "dead.png", "fire.png"];
  List<int> heights = [1, -1, 0, -1, -2, -3];
  double statusHeight = 0.0;
  String assetImage = "";
  // bool showStatus = false;

  List<Message> messages = [
    Message(
      text: "Heeeeey",
      sender: false,
    ),
    Message(
      text: "I’m out on a date rn, can’t talk! Will call ltr k?",
      sender: true,
    ),
    Message(
      text: "Sure beb!",
      sender: false,
    ),
    Message(
      text: "Who’s the lucky guy?",
      sender: false,
    ),
    Message(
      text: "His name is Adam",
      sender: true,
    ),
  ];

  @override
  void initState() {
    down();
    super.initState();
  }

  void down() {
    Future.delayed(const Duration(milliseconds: 1), () {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                padding: const EdgeInsets.all(8),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: index == 0 ? 22 : 12,
                      ),
                      SizedBox(
                        child: Align(
                          alignment: messages[index].sender ? Alignment.centerRight : Alignment.centerLeft,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Stack(
                              alignment: messages[index].sender ? Alignment.bottomRight : Alignment.bottomLeft,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: messages[index].sender ? Colors.blue : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 12.0,
                                      style: BorderStyle.solid,
                                      color: messages[index].sender ? Colors.blue : Colors.grey[100] ?? Colors.white,
                                    ),
                                  ),
                                  child: Text(
                                    messages[index].text,
                                    style: TextStyle(
                                      color: messages[index].sender ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: messages[index].sender ? Alignment.bottomRight : Alignment.bottomLeft,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    color: messages[index].sender ? Colors.blue : Colors.grey[100] ?? Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            AnimatedOpacity(
              opacity: statusHeight == 60 ? 1 : 0,
              duration: Duration(milliseconds: statusHeight == 0 ? 1500 : 100),
              child: AnimatedContainer(
                duration:  Duration(milliseconds: statusHeight == 60 ? 200 : 300),
                width: MediaQuery.of(context).size.width,
                height: statusHeight,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Status "),
                          SizedBox(
                            height: 20,
                            child: Image(
                              image: AssetImage(assetImage),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("Next check up in "),
                          Text(
                            "10 mins",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 52,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < emojis.length; i++)
                        GestureDetector(
                          onTap: () {
                            setState((){
                              statusHeight = 60;
                              assetImage = emojis[i];
                            });
                            Future.delayed(const Duration(seconds: 4), () {
                              setState((){
                                statusHeight = 0;
                              });
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 8,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0 + heights[i]),
                                child: Image(
                                  image: AssetImage(emojis[i]),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Message",
                                style: TextStyle(
                                  color: Color.fromRGBO(80, 80, 80, 1.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_rounded),
                        constraints: const BoxConstraints(),
                        splashRadius: 20.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                        splashRadius: 20.0,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
