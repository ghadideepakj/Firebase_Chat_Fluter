import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/constants.dart';
import 'package:flash_chat_flutter/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var textData = [];

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  _chatScreenState createState() => _chatScreenState();
}

// ignore: camel_case_types
class _chatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  late User loggedInUser;
  late String messageText;
  late var senderData = [];
  List<MessageBubble> messageBubble1 = [];
  final messageTextController = TextEditingController();

  void messageStream() async {
    await for (var snapshot1 in _fireStore.collection('messages').snapshots()) {
      for (var messages in snapshot1.docs) {
        textData.add(messages.data()['text']);
        senderData.add(messages.data()['sender']);

        // final messageWidget = Text('$textData from $senderData');
        // messageWidgets.add(messageWidget);

        // final messageText = dataused;
        // //final messageSender = dataused;
        // final messageWidget = Text('$messageText');
        // messageWidgets.add(messageWidget);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    messageStream();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
              // messageStream();
            },
            icon: Icon(Icons.close),
          )
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder(
                stream: _fireStore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  // List<Text> messageWidgets = [];
                  // final messageText = dataused;
                  //final messageSender = dataused;
                  // final messageWidget = Text('$messageText');
                  // messageWidgets.add(messageWidget);

                  final messageBubble = MessageBubble();
                  messageBubble1.add(messageBubble);

                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      children: messageBubble1,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFiledDecoration,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      messageTextController.clear();
                      _fireStore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email
                      }).then((value) => print(value));
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextTitle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 5.0,
          color: Colors.lightBlueAccent,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Text(
              '$textData',
              style: const TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
      ]),
    );
  }
}
