import 'dart:developer';

import 'package:chatgpt_todo/chatgpt_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatGptTodo extends StatelessWidget {
  ChatGptTodo({super.key});

  final controller = Get.put(ChatGptController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Text(
              'input your apikey into chatgpt_api.dart',
            ),
          ),
          Container(
            child: Center(
              child: Obx(
                () => Text(
                  controller.emoji.value,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
