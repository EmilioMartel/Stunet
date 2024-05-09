

import 'package:flutter/material.dart';
import 'package:stunet/config/helpers/get_yes_no_answer.dart';
import 'package:stunet/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollControler = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hello Pidgs!', fromWhow: FromWho.me),
    Message(text: "im sad, because i will not see you more :'(", fromWhow: FromWho.me),
  ];


  Future<void> sendMessage( String text ) async {  
    if( text.isEmpty ) return;

    final newMessage = Message(text: text, fromWhow: FromWho.me);
    messageList.add(newMessage);

    if( text.trim().endsWith('?') ) await herReplay();

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollControler.animateTo(
      chatScrollControler.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}