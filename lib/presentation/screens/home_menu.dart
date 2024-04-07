import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speakeasy/presentation/widgets/text_title.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'SpeakEasy',
            style: TextStyle(
                fontFamily: 'worksans', color: Colors.white, fontSize: 12.4),
          ),
          leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )),
      body: Stack(
        children: [
          Container(
              // Place as the child widget of a scaffold
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/gradient_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container()),
          ListView(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(colors: [
                        Colors.indigo,
                        Colors.deepPurple,
                      ]),
                    ),
                    child: const Center(
                      child: Text("Pronunciation Practice",
                          style: TextStyle(
                              fontFamily: 'worksans',
                              fontSize: 25.0,
                              color: Colors.white)),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/words');
                      },
                      child: const TextTitle(textToShow: "Words")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/verbs');
                      },
                      child: const TextTitle(textToShow: "Verbs")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/questions');
                      },
                      child: const TextTitle(textToShow: "Questions")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/quotes');
                      },
                      child: const TextTitle(textToShow: "Famous Quotes"))
                ]),
          ])
        ],
      ),
    );
  }
}
