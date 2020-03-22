import 'package:discord/providers/sub_channel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final ScrollController _scrollController = ScrollController();
  int _messagesCount = 50;
  int messageListLength = 0;
  bool firstTime = true;

  @override
  void initState() {
    final friends = Provider.of<Friends>(context, listen: false);
    final main = Provider.of<Main>(context, listen: false);
    final groups = Provider.of<Groups>(context, listen: false);

    List<MessageBox> messageList = [];

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        firstTime = false;
        _messagesCount = _messagesCount + 50;
        main.selectedScreen == 'FriendChat'
            ? Firestore.instance
                .collection('FriendChats')
                .where('id', isEqualTo: friends.currentlySelectedId)
                .getDocuments()
                .then((response) => response.documents[0].reference
                        .collection('messages')
                        .orderBy('time', descending: true)
                        .limit(_messagesCount)
                        .getDocuments()
                        .then((response) {
                      String lastMessageDate;
                      String lastMessageTime;

                      List<String> subMessageList = [];
                      response.documents.forEach((doc) {
                        String curTime = DateFormat('h:mm a')
                            .format(doc.data['time'].toDate());
                        String curDate = DateFormat.yMMMd()
                            .format(doc.data['time'].toDate());
                        if (subMessageList.isEmpty) {
                          subMessageList.add(doc.data['message']);
                          lastMessageDate = curDate;
                          lastMessageTime = curTime;
                        } else if (lastMessageTime == curTime &&
                            lastMessageDate == curDate) {
                          subMessageList.add(doc.data['message']);
                        } else {
                          messageList.add(MessageBox(
                            loading: true,
                            messageList: subMessageList.reversed.toList(),
                            time: lastMessageTime,
                            date: lastMessageDate,
                          ));
                          subMessageList = [doc.data['message']];
                          lastMessageDate = curDate;
                          lastMessageTime = curTime;
                        }
                      });
                      messageList.add(MessageBox(
                        loading: true,
                        messageList: subMessageList.reversed.toList(),
                        time: lastMessageTime == null ? '' : lastMessageTime,
                        date: lastMessageDate == null ? '' : lastMessageDate,
                      ));
                      friends.addMessage(
                        messages: messageList,
                        id: friends.currentlySelectedId,
                      );
                      if (messageListLength == messageList.length) {
                        messageList[messageList.length - 1].setLoading(false);
                      } else {
                        messageListLength = messageList.length;
                      }

                      messageList = [];
                    }))
            : Firestore.instance
                .collection('GroupChats')
                .where('id', isEqualTo: groups.currentlySelectedId)
                .getDocuments()
                .then((response) => response.documents[0].reference
                        .collection('Channels')
                        .document(main.selectedSubChannel.parentChannelName)
                        .collection('SubChannels')
                        .document(main.selectedSubChannel.name)
                        .collection('messages')
                        .orderBy('time', descending: true)
                        .limit(_messagesCount)
                        .snapshots()
                        .listen((snapshot) {
                      String lastMessageDate;
                      String lastMessageTime;

                      List<String> subMessageList = [];
                      snapshot.documents.forEach((doc) {
                        String curTime = DateFormat('h:mm a')
                            .format(doc.data['time'].toDate());
                        String curDate = DateFormat.yMMMd()
                            .format(doc.data['time'].toDate());
                        if (subMessageList.isEmpty) {
                          subMessageList.add(doc.data['message']);
                          lastMessageDate = curDate;
                          lastMessageTime = curTime;
                        } else if (lastMessageTime == curTime &&
                            lastMessageDate == curDate) {
                          subMessageList.add(doc.data['message']);
                        } else {
                          messageList.add(MessageBox(
                            loading: true,
                            messageList: subMessageList.reversed.toList(),
                            time: lastMessageTime,
                            date: lastMessageDate,
                          ));
                          subMessageList = [doc.data['message']];
                          lastMessageDate = curDate;
                          lastMessageTime = curTime;
                        }
                      });
                      messageList.add(MessageBox(
                        loading: true,
                        messageList: subMessageList.reversed.toList(),
                        time: lastMessageTime,
                        date: lastMessageDate,
                      ));
                      main.selectedSubChannel.addMessage(
                        messageList: messageList,
                      );

                      if (messageListLength == messageList.length) {
                        messageList[messageList.length - 1].setLoading(false);
                      } else {
                        messageListLength = messageList.length;
                      }
                      messageList = [];
                    }));
      }
    });

    main.selectedScreen == 'FriendChat'
        ? Firestore.instance
            .collection('FriendChats')
            .where('id', isEqualTo: friends.currentlySelectedId)
            .getDocuments()
            .then((response) => response.documents[0].reference
                    .collection('messages')
                    .orderBy('time', descending: true)
                    .limit(_messagesCount)
                    .snapshots()
                    .listen((snapshot) {
                  String lastMessageDate;
                  String lastMessageTime;
                  List<String> subMessageList = [];
                  snapshot.documents.forEach((doc) {
                    String curTime =
                        DateFormat('h:mm a').format(doc.data['time'].toDate());
                    String curDate =
                        DateFormat.yMMMd().format(doc.data['time'].toDate());
                    if (subMessageList.isEmpty) {
                      subMessageList.add(doc.data['message']);
                      lastMessageDate = curDate;
                      lastMessageTime = curTime;
                    } else if (lastMessageTime == curTime &&
                        lastMessageDate == curDate) {
                      subMessageList.add(doc.data['message']);
                    } else {
                      messageList.add(MessageBox(
                        loading: true,
                        messageList: subMessageList.reversed.toList(),
                        time: lastMessageTime,
                        date: lastMessageDate,
                      ));
                      subMessageList = [doc.data['message']];
                      lastMessageDate = curDate;
                      lastMessageTime = curTime;
                    }
                  });
                  messageList.add(MessageBox(
                    loading: true,
                    messageList: subMessageList.reversed.toList(),
                    time: lastMessageTime == null ? '' : lastMessageTime,
                    date: lastMessageDate == null ? '' : lastMessageDate,
                  ));
                  friends.addMessage(
                    messages: messageList,
                    id: friends.currentlySelectedId,
                  );
                  int totalMessages = 0;
                  if (firstTime) {
                    for (int i = 0; i < messageList.length; i++) {
                      totalMessages += messageList[i].messageList.length;
                    }
                    messageListLength = messageList.length;
                    List<MessageBox> msgList = friends
                        .friendList[friends.currentlySelectedId]['messages'];
                    if (totalMessages < 50) {
                      msgList[msgList.length - 1].setLoading(false);
                    }
                  }
                  messageList = [];
                }))
        : Firestore.instance
            .collection('GroupChats')
            .where('id', isEqualTo: groups.currentlySelectedId)
            .getDocuments()
            .then((response) => response.documents[0].reference
                    .collection('Channels')
                    .document(main.selectedSubChannel.parentChannelName)
                    .collection('SubChannels')
                    .document(main.selectedSubChannel.name)
                    .collection('messages')
                    .orderBy('time', descending: true)
                    .limit(_messagesCount)
                    .snapshots()
                    .listen((snapshot) {
                  String lastMessageDate;
                  String lastMessageTime;

                  List<String> subMessageList = [];
                  snapshot.documents.forEach((doc) {
                    String curTime =
                        DateFormat('h:mm a').format(doc.data['time'].toDate());
                    String curDate =
                        DateFormat.yMMMd().format(doc.data['time'].toDate());
                    if (subMessageList.isEmpty) {
                      subMessageList.add(doc.data['message']);
                      lastMessageDate = curDate;
                      lastMessageTime = curTime;
                    } else if (lastMessageTime == curTime &&
                        lastMessageDate == curDate) {
                      subMessageList.add(doc.data['message']);
                    } else {
                      messageList.add(MessageBox(
                        loading: true,
                        messageList: subMessageList.reversed.toList(),
                        time: lastMessageTime,
                        date: lastMessageDate,
                      ));
                      subMessageList = [doc.data['message']];
                      lastMessageDate = curDate;
                      lastMessageTime = curTime;
                    }
                  });
                  messageList.add(MessageBox(
                    loading: true,
                    messageList: subMessageList.reversed.toList(),
                    time: lastMessageTime == null ? '' : lastMessageTime,
                    date: lastMessageDate == null ? '' : lastMessageDate,
                  ));
                  main.selectedSubChannel.addMessage(
                    messageList: messageList,
                  );
                  int totalMessages = 0;
                  if (firstTime) {
                    for (int i = 0; i < messageList.length; i++) {
                      totalMessages += messageList[i].messageList.length;
                    }
                    messageListLength = messageList.length;
                    List<MessageBox> msgList = main.selectedSubChannel.messages;
                    if (totalMessages < 50) {
                      msgList[msgList.length - 1].setLoading(false);
                    }
                  }

                  messageList = [];
                }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
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
              value: main.selectedScreen == 'FriendChat'
                  ? null
                  : main.selectedSubChannel,
              child: Consumer<SubChannel>(
                builder: (ctx, _, ch) => ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  reverse: true,
                  itemBuilder: (ctx, index) {
                    List<MessageBox> messages =
                        main.selectedScreen == 'FriendChat'
                            ? friends.friendList[friends.currentlySelectedId]
                                ['messages']
                            : main.selectedSubChannel.messages;

                    bool newDate;
                    if (index == messages.length - 1) {
                      newDate = true;
                    } else if (messages[index].date ==
                        messages[index + 1].date) {
                      newDate = false;
                    } else
                      newDate = true;

                    return ChangeNotifierProvider.value(
                      value: (main.selectedScreen == 'FriendChat'
                          ? friends.friendList[friends.currentlySelectedId]
                              ['messages'][index] as MessageBox
                          : main.selectedSubChannel.messages[index]
                              as MessageBox),
                      child: Consumer<MessageBox>(
                        builder: (ctxt, messageboxx, ch) => ChatMessage(
                          loading: messageboxx.loading,
                          index: index,
                          newDate: newDate,
                          date: messages[index].date,
                          time: messages[index].time,
                        ),
                      ),
                    );
                  },
                  itemCount: main.selectedScreen == 'FriendChat'
                      ? friends
                          .friendList[friends.currentlySelectedId]['messages']
                          .length
                      : main.selectedSubChannel.messages.length,
                ),
              ),
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
                          String message = _textController.value.text.trim();
                          _textController.clear();
                          main.selectedScreen == 'FriendChat'
                              ? Firestore.instance
                                  .collection('FriendChats')
                                  .where('id',
                                      isEqualTo: friends.currentlySelectedId)
                                  .getDocuments()
                                  .then((response) => response
                                          .documents[0].reference
                                          .collection('messages')
                                          .add({
                                        'message': message,
                                        'time': DateTime.now(),
                                        'sender': main.userName,
                                      }))
                              : Firestore.instance
                                  .collection('GroupChats')
                                  .where('id',
                                      isEqualTo: groups.currentlySelectedId)
                                  .getDocuments()
                                  .then((response) => response
                                          .documents[0].reference
                                          .collection('Channels')
                                          .document(main.selectedSubChannel
                                              .parentChannelName)
                                          .collection('SubChannels')
                                          .document(
                                              main.selectedSubChannel.name)
                                          .collection('messages')
                                          .add({
                                        'message': message,
                                        'time': DateTime.now(),
                                        'sender': main.userName,
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
