import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupchatapp/helper_functions/shared_preference.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController textEditingController = new TextEditingController();

  addMessagetoDb() async {
    await FirebaseFirestore.instance
        .collection("groupchat")
        .doc("EpTz3S4oL1Iv07tqJg5l")
        .collection("chats")
        .add({
      "create_ts": DateTime.now(),
      "message": textEditingController.text,
      "profile_pic_url": await SharedPreferenceHelper.getUserProfilePic(),
      "username": await SharedPreferenceHelper.getUserName()
    });
    textEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Chat"),
      ),
      body: Container(
          child: Stack(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("groupchat")
                .doc("EpTz3S4oL1Iv07tqJg5l")
                .collection("chats")
                .orderBy("create_ts", descending: false)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data.documents[index];
                        return MessagesTile(
                          message: ds["message"],
                          profile_pic: ds["profile_pic_url"],
                        );
                      },
                    )
                  : Container(child: CircularProgressIndicator());
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(hintText: "Message"),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        addMessagetoDb();
                      },
                      child: Icon(Icons.send))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class MessagesTile extends StatelessWidget {
  final profile_pic, message;

  MessagesTile({this.message, this.profile_pic});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              profile_pic,
              height: 50,
              width: 50,
            ),
          ),
          SizedBox(width: 16,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xffF1F0F0),
            ),
            child: Text(message)
          )
        ],
      )
    );
  }
}
