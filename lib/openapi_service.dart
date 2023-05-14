import 'dart:convert';

import 'package:gpt_flutter/screet.dart';
import 'package:http/http.dart' as http;
class OpenApiService{

  Future<String> isArtPromptApi(String prompt)async{
   try{
  final response=await http.post(Uri.parse("https://api.openai.com/v1/completions"),
  headers: {
    "Content-Type":"application/json",
    "Authorization":"Bearer $AIAPIKey",
  },
  body:jsonEncode({
    "model": "gpt-3.5-turbo",
    "messages" :[
      {
        "role": "user",
        "content": "Does this message want to generate an AI picture, images, art or anything similar? $prompt . Simply answer with a yes or no."
      }


    ]

  }),
  );
    print(response.body);
    if(response.statusCode==200){
      print("yes");
    }
    return "AI";
   }catch(e){

     return e.toString();
   }
  }

  Future<String> chatgptApi(String prompt)async{
    return "ChatGpt";
  }

  Future<String> dalleApi(String prompt)async{
   return "DallE";
  }

}