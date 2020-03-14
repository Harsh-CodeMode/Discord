import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/friends.dart';
import '../providers/message_box.dart';
import '../providers/main_provider.dart';

import '../widgets/chat_message.dart';

class ChatBox extends StatefulWidget {
  final double statusBarHeight;

  ChatBox(this.statusBarHeight);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final friends = Provider.of<Friends>(context, listen: false);
    const appBarHeight = 56;
    final chatBoxHeight = deviceHeight - appBarHeight - widget.statusBarHeight;
    final main = Provider.of<Main>(context, listen: false);

    return Container(
      height: chatBoxHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              reverse: true,
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: main.selectedScreen == 'FriendChat'
                    ? friends.friendList[friends.currentlySelectedId]
                        ['messages'][index] as MessageBox
                    : main.selectedSubChannel.messages[index],
                child: ChatMessage(index),
              ),
              itemCount: main.selectedScreen == 'FriendChat'
                  ? friends.friendList[friends.currentlySelectedId]['messages']
                      .length
                  : main.selectedSubChannel.messages.length,
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 45, maxHeight: 100),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              border: Border(
                top: BorderSide(color: Colors.black26, width: 1),
              ),
            ),
            child: Scrollbar(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: deviceWidth - 40,
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(color: Colors.white60),
                        decoration: InputDecoration(
                          hintText: 'Message your friend',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white30),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context).canvasColor,
                      customBorder: CircleBorder(),
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.send,
                            color: Colors.white30,
                            size: 25,
                          )),
                      onTap: () {
                        if (_textController.value.text.trim() != '') {
                          main.selectedScreen == 'FriendChat'
                              ? friends.friendList[friends.currentlySelectedId]
                                      ['messages'][0]
                                  .addMessage(_textController.value.text.trim())
                              : main.selectedSubChannel.messages[0].addMessage(
                                  _textController.value.text.trim());
                        }
                        _textController.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
