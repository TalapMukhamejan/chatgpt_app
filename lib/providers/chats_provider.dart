import 'package:flutter/foundation.dart';
import '../models/chat_model.dart';
import '../services/api_services.dart';

class ChatsProvider with ChangeNotifier {
  List<ChatModel> chatList = [];

  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String message}) {
    chatList.add(
      ChatModel(
        message: message,
        chatIdx: 0,
      ),
    );
    notifyListeners();
  }

  Future<void> sendMesasgeAndGetAnswers(
      {required String message, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiServices.sendMessageGPT(
        message: message,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiServices.sendMessage(
        message: message,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}
