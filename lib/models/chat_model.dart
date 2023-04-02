class ChatModel {
  final String message;
  final int chatIdx;

  ChatModel({required this.message, required this.chatIdx});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        message: json['msg'],
        chatIdx: json['chatIndex'],
      );
}
