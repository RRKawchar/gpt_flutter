import 'package:flutter/material.dart';
import 'package:gpt_flutter/home_page.dart';
import 'package:gpt_flutter/pallet.dart';

void main(){
  runApp((const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat gpt',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor
        )
      ),
      home:  const HomePage(),
    );
  }
}
