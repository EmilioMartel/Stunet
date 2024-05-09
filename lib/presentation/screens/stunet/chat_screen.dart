import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stunet/domain/entities/message.dart';
import 'package:stunet/presentation/providers/yes_no_provider.dart';
import 'package:stunet/presentation/widgets/chat/her_message_bubble.dart';
import 'package:stunet/presentation/widgets/chat/my_message_bubble.dart';
import 'package:stunet/presentation/widgets/shared/message_field_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.-ldTtDFtLCjLk2K-bTrshwHaL3?w=186&h=298&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
          ),
        ),
        title: const Text('Pidgs <3'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollControler,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return ( message.fromWhow ==  FromWho.hers )
                  ? HerMessageBubble(message: message)
                  : MyMessageBubble(message: message,);
                }
              )
            ),

            //todo: caja de texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage
            ),
            
          
          ],
        ),
      ),
    );
  }
}