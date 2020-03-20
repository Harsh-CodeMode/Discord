import 'package:discord/providers/sub_channel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/friends.dart';
import '../providers/message_box.dart';
import '../providers/main_provider.dart';
import '../providers/groups.dart';

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
  void initState() {
    final main = Provider.of<Main>(context, listen: false);
    final friends = Provider.of<Friends>(context, listen: false);
    final groups = Provider.of<Groups>(context, listen: false);
    List<MessageBox> messageList = [];
    main.selectedScreen == 'FriendChat'
      ? Firestore.instance
      .collection('FriendChats')
      .where('id', isEqualTo: friends.currentlySelectedId)
      .getDocuments()
      .then((response) =>
      response.documents.forEach((doc) =>
        doc
          .reference
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots()
          .listen((response) {
          String lastMessageTime;
          String lastMessageDate;
          List<String> subMessageList = [];
          response.documents.forEach((doc) {
            final String curTime =
            DateFormat("h:mm a").format(doc.data['time'].toDate());
            final String curDate = DateFormat()
              .add_yMMMd()
              .format(doc.data['time'].toDate());
            if (subMessageList.isEmpty) {
              subMessageList.add(doc.data['message']);
              lastMessageTime = curTime;
              lastMessageDate = curDate;
            } else if (curTime == lastMessageTime &&
              lastMessageDate == curDate) {
              subMessageList.add(doc.data['message']);
            } else {
              messageList.add(MessageBox(
                messageList: subMessageList.reversed.toList(),
                time: lastMessageTime,
                date: lastMessageDate));
              lastMessageDate = curDate;
              lastMessageTime = curTime;
              subMessageList = [doc.data['message']];
            }
          });
          messageList.add(MessageBox(
            messageList: subMessageList.reversed.toList(),
            time: lastMessageTime != null ? lastMessageTime : '',
            date: lastMessageDate != null ? lastMessageDate : '',
          ));
          friends.addMessage(
            id: friends.currentlySelectedId,
            messages: messageList,
          );

          messageList = [];
        })))
      : Firestore.instance
      .collection('GroupChats')
      .where('id', isEqualTo: groups.currentlySelectedId)
      .getDocuments()
      .then((response) =>
      response.documents.forEach((doc) =>
        doc
          .reference
          .collection('Channels')
          .document(main.selectedSubChannel.parentChannelName)
          .collection('SubChannels')
          .document(main.selectedSubChannel.name)
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots()
          .listen((response) {
          String lastMessageTime;
          String lastMessageDate;
          List<String> subMessageList = [];
          response.documents.forEach((doc) {
            final String curTime =
            DateFormat("h:mm a").format(doc.data['time'].toDate());
            final String curDate = DateFormat()
              .add_yMMMd()
              .format(doc.data['time'].toDate());
            if (subMessageList.isEmpty) {
              subMessageList.add(doc.data['message']);
              lastMessageTime = curTime;
              lastMessageDate = curDate;
            } else if (curTime == lastMessageTime &&
              lastMessageDate == curDate) {
              subMessageList.add(doc.data['message']);
            } else {
              messageList.add(MessageBox(
                messageList: subMessageList.reversed.toList(),
                time: lastMessageTime,
                date: lastMessageDate));
              lastMessageDate = curDate;
              lastMessageTime = curTime;
              subMessageList = [doc.data['message']];
            }
          });
          messageList.add(MessageBox(
            messageList: subMessageList.reversed.toList(),
            time: lastMessageTime != null ? lastMessageTime : '',
            date: lastMessageDate != null ? lastMessageDate : '',
          ));
          main.selectedSubChannel
            .setMessages(messageList: messageList);
          messageList = [];
        })));
    // TODO: implement didChangeDependencies
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery
      .of(context)
      .size
      .height;
    final deviceWidth = MediaQuery
      .of(context)
      .size
      .width;
    final friends = Provider.of<Friends>(context);
    const appBarHeight = 56;
    final chatBoxHeight = deviceHeight - appBarHeight - widget.statusBarHeight;
    final main = Provider.of<Main>(context, listen: false);
    final groups = Provider.of<Groups>(context, listen: false);


    return Container(
      height: chatBoxHeight,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ChangeNotifierProvider.value(
              value: main.selectedSubChannel,
              child: Consumer<SubChannel>(builder: (ctx, _, ch) =>
                ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  reverse: true,
                  itemBuilder: (ctx, index) {
                    bool newDate;
                    int chatMessagesLength = main.selectedScreen == 'FriendChat'
                      ? friends
                      .friendList[friends.currentlySelectedId]['messages']
                      .length
                      : main.selectedSubChannel.messages.length;
                    final List<MessageBox> messageBoxList =
                    main.selectedScreen == 'FriendChat'
                      ? friends.friendList[friends.currentlySelectedId]
                    ['messages']
                      : main.selectedSubChannel.messages;

                    if (index + 1 == chatMessagesLength) {
                      newDate = true;
                    } else if (messageBoxList[index].date ==
                      messageBoxList[index + 1].date) {
                      newDate = false;
                    } else {
                      newDate = true;
                    }

                    return ChangeNotifierProvider.value(
                      value: main.selectedScreen == 'FriendChat'
                        ? messageBoxList[index] as MessageBox
                        : main.selectedSubChannel.messages[index],
                      child: ChatMessage(
                        index: index,
                        newDate: newDate,
                        date: (messageBoxList[index] as MessageBox).date,
                        time: (messageBoxList[index] as MessageBox).time,
                      ),
                    );
                  },
                  itemCount: main.selectedScreen == 'FriendChat'
                    ? friends.friendList[friends
                    .currentlySelectedId]['messages']
                    .length
                    : main.selectedSubChannel.messages.length,
                ),),),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 45, maxHeight: 100),
            decoration: BoxDecoration(
              color: Theme
                .of(context)
                .accentColor,
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
                      splashColor: Theme
                        .of(context)
                        .canvasColor,
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
                          String msg = _textController.value.text.trim();
                          _textController.clear();
                          main.selectedScreen == 'FriendChat'
                            ? Firestore.instance
                            .collection('FriendChats')
                            .where('id',
                            isEqualTo: friends.currentlySelectedId)
                            .getDocuments()
                            .then((response) =>
                            response.documents[0].reference
                              .collection('messages')
                              .add({
                              'message': msg,
                              'sender': main.userName,
                              'time': DateTime.now()
                            }))
                            : Firestore.instance
                            .collection('GroupChats')
                            .where('id',
                            isEqualTo: groups.currentlySelectedId)
                            .getDocuments()
                            .then((response) =>
                            response.documents[0].reference
                              .collection('Channels')
                              .document(
                              main.selectedSubChannel.parentChannelName)
                              .collection('SubChannels')
                              .document(main.selectedSubChannel.name)
                              .collection('messages')
                              .add({
                              'message': msg,
                              'sender': main.userName,
                              'time': DateTime.now()
                            }));
                        }
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

//                 Adding all sub channels on firestore

//                        List<String> names = [
//                          'Welcome',
//                          'Important',
//                          'PUBG',
//                          'Dota 2',
//                          'Free Fire'
//                        ];
//                        List<List<String>> subChannels = [
//                          ['Welcome'],
//                          ['About Me', 'Announcements'],
//                          [
//                            'Pubg Tournaments',
//                            'Pubg Tips',
//                            'Pubg Mobile Players',
//                            'Pubg Emulator Players',
//                          ],
//                          [
//                            'Dota 2 Tournaments',
//                            'Dota 2 Tips',
//                            'Dota 2 Mobile Players',
//                            'Dota 2 Emulator Players',
//                          ],
//                          [
//                            'Free Fire Tournaments',
//                            'Free Fire Tips',
//                            'Free Fire Mobile Players',
//                            'Free Fire Emulator Players',
//                          ]
//                        ];
//                        for (int i = 2; i < 14; i++) {
//                          Firestore.instance
//                              .collection('GroupChats')
//                              .where('id', isEqualTo: i)
//                              .getDocuments()
//                              .then((response) {
//                            for (int j = 0; j < 5; j++) {
//                              for (int k = 0; k < subChannels[j].length; k++) {
//                                response.documents[0].reference
//                                    .collection('Channels')
//                                    .document(names[j])
//                                    .collection('SubChannels')
//                                    .document(subChannels[j][k])
//                                    .setData({'name': subChannels[j][k]}).then((_)=> print('done'));
//                              }
//                            }
//                          }).then((_) => print('done'));
//                        }
