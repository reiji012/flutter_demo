
class ConversationsHistory {
  bool ok;
  List<Message> messages;

  ConversationsHistory.fromMap(Map json) {
    ok = json['ok'];
    messages = new List<Message>();

    List<Map> members = (json['messages'] as List).cast();

    for (int i = 0; i < members.length; ++i) {
      messages.add(new Message.fromMap(members[i]));
    }
  }
}

class Message {
  String type;
  String user;
  String text;
  String ts;

  Message.fromMap(Map json) {
    type = json['type'];
    user = json['user'];
    text = json['text'];
    ts = json['ts'];
  }
}
