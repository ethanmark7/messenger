import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final List<String> names = <String>["Kelly Foster", "Tilly"];
  final List<String> photos = <String>["image_5.png", "image_6.png"];
  final List<String> status = <String>["Nearby", "Nearby"];
  final List<String> statusImage = <String>["ok.png", "ok.png"];
  bool showFriends = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showFriends = true;
      });
    });
    super.initState();
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
        title: const Text(
          "Friends",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: showFriends ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          children: [
            for (int i = 0; i < names.length; i++)
              Container(
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
                              const Text(
                                "Status",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 50 - 50 - 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status[i],
                              ),
                              SizedBox(
                                height: 24,
                                child: Image(
                                  image: AssetImage(
                                    statusImage[i],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ) : const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
