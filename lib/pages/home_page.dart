import 'package:flashcards/flashcard.dart';
import 'package:flashcards/views/flash_card_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FlashCard> _list = [
    FlashCard("Flutter Release Date", "May 2017"),
    FlashCard("What programming language does flutter use?", "dart"),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash Card"),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                height: 250,
                width: 250,
                child: FlipCard(
                  back: FlashCardView(text: _list[_currentIndex].answers),
                  front: FlashCardView(text: _list[_currentIndex].questions)
                ),
              ),
            const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(onPressed: showPrevCard, icon: const Icon(Icons.chevron_left),label: const Text("Prev"),),
                  OutlinedButton.icon(onPressed: showNextCard, icon: const Icon(Icons.chevron_right),label: const Text("Next"),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void showNextCard(){
    setState((){
      _currentIndex = (_currentIndex + 1 < _list.length) ? _currentIndex + 1 : 0;
    });
  }
  void showPrevCard(){
    setState((){
      _currentIndex = (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _list.length - 1;
    });
  }
}
