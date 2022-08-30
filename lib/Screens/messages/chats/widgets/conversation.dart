import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';
import '../app_theme.dart';
import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('cart_message').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, int index) {
                final message = messages[index];
                bool isMe = message.sender.id == currentUser.id;
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: isMe
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // if (!isMe)
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(user.avatar),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            decoration: BoxDecoration(
                                color:
                                    //  isMe
                                    //     ? MyTheme.kAccentColor
                                    //     :
                                    Color(0xffF9F9F9),
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              snapshot.data!.docs[index]['cart_message'],
                              // messages[index].text,
                              style: GoogleFonts.getFont(
                                "Poppins",
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                textStyle: TextStyle(
                                    color: isMe
                                        ? Color(0xff707070)
                                        : Color(0xff585F66),
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: isMe
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!isMe)
                              SizedBox(
                                width: 40,
                              ),
                            Text(message.time,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Color(0xff606060).withOpacity(0.48)))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        });
    // ListView.builder(
    //     reverse: true,
    //     itemCount: messages.length,
    //     itemBuilder: (context, int index) {
    //       final message = messages[index];
    //       bool isMe = message.sender.id == currentUser.id;
    //       return Container(
    //         margin: EdgeInsets.only(top: 10),
    //         child: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment:
    //                   isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //               children: [
    //                 if (!isMe)
    //                   CircleAvatar(
    //                     radius: 15,
    //                     backgroundImage: AssetImage(user.avatar),
    //                   ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.all(10),
    //                   constraints: BoxConstraints(
    //                       maxWidth: MediaQuery.of(context).size.width * 0.6),
    //                   decoration: BoxDecoration(
    //                       color:
    //                           isMe ? MyTheme.kAccentColor : Color(0xffF9F9F9),
    //                       borderRadius: BorderRadius.circular(12)),
    //                   child: Text(
    //                     messages[index].text,
    //                     style: GoogleFonts.getFont(
    //                       "Poppins",
    //                       fontSize: 13,
    //                       fontWeight: FontWeight.w400,
    //                       textStyle: TextStyle(
    //                           color:
    //                               isMe ? Color(0xff707070) : Color(0xff585F66),
    //                           letterSpacing: .5),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 5),
    //               child: Row(
    //                 mainAxisAlignment:
    //                     isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    //                 children: [
    //                   if (!isMe)
    //                     SizedBox(
    //                       width: 40,
    //                     ),
    //                   Text(message.time,
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 10,
    //                           color: Color(0xff606060).withOpacity(0.48)))
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     });
  }
}
