import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_slack_oauth_firebase/flutter_slack_oauth_firebase.dart';
import 'package:flutter_slack_oauth/flutter_slack_oauth.dart';
import 'package:flutter_slack_oauth/oauth/slack.dart' as slack;

class ApiDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ApiDemoState();
  }
}

class ApiDemoState extends State<ApiDemo> {
  String _content;
  String webhookURL = "https://hooks.slack.com/services/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";

  void _request() async {
    String url = webhookURL;
    Map<String, String> headers = {"Content-Type": "application/x-www-form-urlencoded"};
    String body = json.encode({'text': 'text'});

    http.Response resp = await http.post(url, headers: headers, body: body);
    if (resp.statusCode != 200) {
      setState(() {
        int statusCode = resp.statusCode;
        _content = "Failed to post $statusCode";
      });
      return;
    }
    setState(() {
      _content = resp.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('second Page')),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SlackButton(
            clientId: '952564208582.952106366165',
            clientSecret: 'fe953f6c8b1f3f534e94179836567e9b',
            redirectUrl: 'https://hooks.slack.com/services/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',
            onSuccess: () async {
              String accessToken = await Token.getLocalAccessToken();

              String chatId = "CU0GL6QT0";
//              UserList users = await slack.getUsers(accessToken);
              UserList chats = await slack.getConversations(accessToken, chatId);
//              print(users);
              print(chats);
              Scaffold.of(context).showSnackBar(new SnackBar(
//                content: new Text('We found ' + users.users.length.toString() + " users"),
              ));
            },
            onFailure: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('Slack Login Failed'),
              ));
            },
            onCancelledByUser: () {
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('Slack Login Cancelled by user'),
              ));
            },
          )
        ),
      )
    );
  }
}