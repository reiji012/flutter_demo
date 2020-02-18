import 'package:flutter/material.dart';
import 'package:flutter_slack_oauth/flutter_slack_oauth.dart';
import '../../Model/slack_history.dart';

class SlackChat extends StatefulWidget {
  UserList userList;
  ConversationsHistory conversationsHistory;

  SlackChat(UserList userLIst, ConversationsHistory conversationsHistory) {
    this.userList = userLIst;
    this.conversationsHistory = conversationsHistory;
  }

  @override
  State<StatefulWidget> createState() {
    return _SlackChatState(userList, conversationsHistory);
  }
}

class _SlackChatState extends State<SlackChat> {

  UserList userList;
  ConversationsHistory conversationsHistory;

  _SlackChatState(UserList userLIst, ConversationsHistory conversationsHistory) {
    this.userList = userLIst;
    this.conversationsHistory = conversationsHistory;
  }

  String userImageUrl(String userId) {
    var user = userList.users.singleWhere((user) => user.id == userId, orElse: () => null);
    if (user != null) {
      return user.profile.image192;
    }
    return "https://i2.wp.com/a.slack-edge.com/df10d/img/avatars/ava_0011-512.png?ssl=1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slack chat'),
      ),
      body: Container(
        child: listView(),
      ),
    );
  }

  Widget listView() {
    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.vertical,
      children: <Widget>[
        for(var message in conversationsHistory.messages ) Column (
          children: <Widget>[
            cell(message),
            Container(
              margin: EdgeInsets.only(
                  left: 20,
                  right: 30
              ),
              child: Divider(
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    );
  }

  // リストView用のCellWidget
  Widget cell(Message message) {
    return Container(
      margin: EdgeInsets.only(
          left: 20,
          right: 30
      ),
      height: 100,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(userImageUrl(message.user))
                )
            ),
            height: 30,
            width: 30,
          ),
          Container(
            width: 200,
            child: Text(
              message.text,
              style: TextStyle(fontSize: 20),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}