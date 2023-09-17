import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rezbot/screens/answerscreen.dart';
import 'dart:convert';

class PromtAsk {
  searchCohere(context, prompt) async {
    print(prompt);

    final response = await http.post(
      Uri.parse('https://api.cohere.ai/v1/generate'),
      headers: <String, String>{
        "accept": "application/json",
        "authorization": "Bearer SvA240rMmvCXD9eV6M40EgwJnWddJTl9upsxqONn",
        "content-Type": "application/json",
      },
      body: jsonEncode({
        "max_tokens": 20,
        "truncate": "END",
        "return_likelihoods": "NONE",
        "prompt": "$prompt"
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response

      print('Response data: ${response.body}');
      String answer = response.body;
      final data = jsonDecode(answer);
      final newdata = jsonDecode(data);

      print(newdata["text"]);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnswerScreen()),
      );
    } else {
      // If the server returns an error response
      print('Error: ${response.body}');
    }
  }
}
