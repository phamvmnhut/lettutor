import 'package:flutter/material.dart';
import 'package:lettutor/datas/local.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/ui/message/comp/message_tutor_item.dart';
import 'package:lettutor/utils/routes/routes.dart';

class _MessageModel {
  final String text;
  bool isMe;

  _MessageModel({required this.text, this.isMe = false});
}

class MessageChatUI extends StatelessWidget {
  MessageChatUI({Key? key}) : super(key: key);
  List<_MessageModel> listMessage = [
    _MessageModel(text: "Hello", isMe: true),
    _MessageModel(text: "Heelo you"),
    _MessageModel(text: "Im Jussty", isMe: true),
    _MessageModel(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        isMe: true),
    _MessageModel(text: "OkE, i can help you"),
  ];

  TutorModel tutor = LocalData.tutorDetail;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color cardColor = Theme.of(context).cardColor;
    Color priColor = Theme.of(context).primaryColor;
    Color hlColor = Theme.of(context).highlightColor;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined, color: cardColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Flexible(
                  child: MessageTutorItem(
                    tutor: tutor,
                    trailing:
                        Icon(Icons.settings_applications, color: priColor),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: listMessage
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: e.isMe
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: cardColor,
                                ),
                                constraints:
                                    BoxConstraints(maxWidth: width * 2 / 3),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    e.text,
                                    style: textTheme.caption,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hoverColor: Theme.of(context).accentColor,
                      labelStyle: textTheme.caption,
                      hintText: 'Type text here',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 1, color: priColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(width: 1, color: priColor)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.send, size: 40, color: priColor),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
