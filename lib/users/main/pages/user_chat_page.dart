import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserChatPage extends StatefulWidget {
  String username;
  String buyername;
  UserChatPage({super.key, required this.buyername, required this.username});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ListTile(
            title: Text(widget.buyername.toString()),
            subtitle: Text(widget.username.toString()),
          )
        ],
      ),
    );
  }
}
