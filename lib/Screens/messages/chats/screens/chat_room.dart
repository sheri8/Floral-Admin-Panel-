import 'package:floral/Utils/colors.dart';

import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.user}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
  final User user;
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        centerTitle: false,
        title: Row(children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              widget.user.avatar,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Text(
              widget.user.name,
              style: TextStyle(
                  color: Color(0xff121212),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              textAlign: TextAlign.start,
            ),
            Text("active now",
                style: TextStyle(
                    color: Color(0xff606060),
                    fontWeight: FontWeight.w400,
                    fontSize: 11)),
          ]),
          // title: Row(
          //   children: [

          //       SizedBox(width: 10,),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [

          //         Text(
          //           'active now',
          //           style: MyTheme.bodyText1.copyWith(fontSize: 16),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ]),
        elevation: 2,
      ),
      backgroundColor: theme,
      // MyTheme.kPrimaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conversation(user: widget.user),
                ),
              ),
            ),
            buildChatComposer()
          ],
        ),
      ),
    );
  }
}
