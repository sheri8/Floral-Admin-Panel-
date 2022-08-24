import 'package:floral/Screens/messages/chats/models/message_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentChats.length,
              itemBuilder: (context, int index) {
                final recentChat = recentChats[index];
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                      height: 50,
                      width: 100,
                      child: InkWell(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(recentChat.avatar),
                            ),
                          ),
                          Text(recentChat.sender.name)
                        ],
                      ))),
                );
              }),
        )
      ],
    );
  }
}
