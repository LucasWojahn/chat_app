import 'dart:io';

import 'package:chat_app/text_composer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, dynamic> data = {};

  void _sendMessage({String text, File imgFile}) async {
    if(imgFile != null){
      TaskSnapshot task = await FirebaseStorage.instance.ref().child(
          DateTime.now().microsecondsSinceEpoch.toString()).putFile(imgFile);

    String url =await task.ref.getDownloadURL();
    data['imgUrl'] = url;
    if (text != null) data['text'] = text;
    }
    FirebaseFirestore.instance.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
        elevation: 0,
      ),
      body: TextComposer(_sendMessage),
    );
  }
}
