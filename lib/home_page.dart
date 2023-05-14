import 'package:flutter/material.dart';
import 'package:gpt_flutter/features_box.dart';
import 'package:gpt_flutter/openapi_service.dart';
import 'package:gpt_flutter/pallet.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  OpenApiService apiService=OpenApiService();
  String lastWords='';
  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText()async{
    await speechToText.initialize();
   setState(() {

   });
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat gpt"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                        color: Pallete.assistantCircleColor,
                        shape: BoxShape.circle),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/virtualAssistant.png'))),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Pallete.borderColor),
                  borderRadius:
                      BorderRadius.circular(20).copyWith(topLeft: Radius.zero),),
              child: const Text(
                "Good Morning, What task can I do for you?",
                style: TextStyle(
                    fontSize: 25,
                    color: Pallete.mainFontColor,
                    fontFamily: 'Cera Pro'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 10, left: 22),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Here are a few features",
                style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,),
              ),
            ),
            Column(
              children: const [
                FeaturesBox(
                  color: Pallete.firstSuggestionBoxColor,
                  headerText: "Chat GPT",
                  descriptionText:
                      'A smarter way to stay organized and informed with ChatGPT',
                ),
                FeaturesBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: "Dall-E",
                  descriptionText:
                  'Get inspired and stay creative with your personal assistant powered by Dall-E',
                ),
                FeaturesBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: "Smart Voice Assistant",
                  descriptionText:
                  'Get the best of both worlds with a voice assistant powered by Dall-E and Chat GPT',
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.firstSuggestionBoxColor,
        onPressed: ()async{
          if(await speechToText.hasPermission && speechToText.isNotListening){
           await startListening();
          }else if(speechToText.isListening){
            await apiService.isArtPromptApi(lastWords);
            await stopListening();
          }else{
           initSpeechToText();
          }
        },
        child: const Icon(Icons.mic),
      ),
    );
  }
}
