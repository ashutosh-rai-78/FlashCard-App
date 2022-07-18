import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flash Card"),
        centerTitle: true,
      ),
      body: SafeArea(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
                width: 250,
                child: FlipCard(
                  back: Card(
                    elevation: 4,
                    child: Center(child: Text("*--------Card--------*")),
                  ),
                  front: Card(
                    elevation: 4,
                    child: Center(child: Text("#-------Card-------#")),
                  ),
                ),
              ),
            SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.chevron_left),label: const Text("Prev"),),
                  OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.chevron_right),label: const Text("Next"),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
