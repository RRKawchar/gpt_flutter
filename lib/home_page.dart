import 'package:flutter/material.dart';
import 'package:gpt_flutter/pallet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Chat gpt"),
      centerTitle: true,
      leading: const Icon(Icons.menu),
    ),
      body: Column(
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
                    shape: BoxShape.circle
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/virtualAssistant.png')
                    )
                ),
              )
            ],
          ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
             margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
               top: 30,
             ),
             decoration: BoxDecoration(
               border: Border.all(
                 color: Pallete.borderColor
               )
             ),
             child: const Text("Good Morning, What task can I do for you?",style: TextStyle(
               fontSize: 25,
               color: Pallete.mainFontColor,
               fontFamily: 'Cera Pro'
             ),),
           )
        ],
      ),
    );
  }
}
