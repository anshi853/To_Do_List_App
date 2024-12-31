import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
 VoidCallback onsave;
 VoidCallback oncancel;

  DialogBox({
    super.key,
     required this.controller,
     required this. oncancel,
     required this.onsave
     });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 120,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          children: [
            TextField(
              controller: controller,
              decoration:InputDecoration(
                border:OutlineInputBorder(),
               
                hintText:"" ,
              ) ,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed:onsave),
                const SizedBox(width: 8),
                MyButton(text: "Cancel", onPressed:oncancel)
              ],
             )
          ],
        )
      ),
    );
  }
}