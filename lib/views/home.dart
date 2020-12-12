import 'package:flutter/material.dart';
import 'package:groupchatapp/views/conversation_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Chat Home"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ConversationScreen()));
            },
            child: ListTile(
              title: Text("FlutterDev Connect"),
              subtitle: Text("A community of Flutter Developers"),
            ),
          ),
          ListTile(
            title: Text("Flutter Chandigarh"),
            subtitle: Text("A community of Flutter Developers"),
          ),
          ListTile(
            title: Text("Chitkara University"),
            subtitle: Text("A Chitkara University students group"),
          )
        ],
      ),
    );
  }
}
