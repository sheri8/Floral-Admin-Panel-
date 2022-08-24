import 'package:flutter/material.dart';
import '../app_theme.dart';

Container buildChatComposer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.white,
    height: 100,
    child: Row(
      children: [

        Expanded(
          child:
           Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
               
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Message',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
                         IconButton(onPressed: (){}, icon: Icon(Icons.send))

              ],
            ),
          ),
        ),
       
       
      ],
    ),
  );
}
