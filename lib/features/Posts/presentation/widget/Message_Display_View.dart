// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MessageDisplayView extends StatelessWidget {
  const MessageDisplayView({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height/3,
      child: Center(
        child:SingleChildScrollView(
          child:Text(message,
          style:
          const TextStyle(
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
          ) ,) ,),
    );
  }
}