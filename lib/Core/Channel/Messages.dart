import 'dart:convert';

class Messages {
  List<dynamic> messages;
  int total;
  bool success;

  Messages({required this.messages, required this.total, required this.success});

  factory Messages.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonList = json['messages'].runtimeType == String
        ? jsonDecode(json['messages'])
        : json['messages'];
    return Messages(
      messages: jsonList,
      total: json['total'],
      success: json['success'],
    );
  }
}