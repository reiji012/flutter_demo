import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/Model/slack_history.dart';

import '../API/slack_request.dart';
import 'package:http/http.dart' as http;

/// Implements the /api/conversations.info call
Future<ConversationsHistory> getConversations(String accessToken, String cannnelId) async {
  String endpoint = "https://slack.com/api/conversations.history?token=$accessToken" + "&channel=$cannnelId";
  final http.Response response = await http.get(endpoint);

  return new ConversationsHistory.fromMap(json.decode(response.body));
}