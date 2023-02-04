import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatGptController extends GetxController {
  ChatGptController();

  final emoji = ''.obs;

  @override
  void onInit() {
    generateResponse('モンスター');
  }

  generateResponse(prompt) async {
    // input your api key
    var apiKey = "api_key";

    var url = Uri.https('api.openai.com', '/v1/completions');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": 'application/json',
        "Authorization": "Bearer $apiKey",
      },
      body: json.encode(
        {
          "model": "text-davinci-003",
          "prompt": 'Convert $prompt into emoji.',
          "temperature": 0.8,
          "max_tokens": 5,
          "top_p": 1,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
        },
      ),
    );

    var responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200 && responseJson['choices'] != null) {
      var emojiResponse = responseJson['choices'][0]['text'];
      emoji.value = emojiResponse;
    } else {
      inspect('Failed to get emoji response');
    }
  }
}
