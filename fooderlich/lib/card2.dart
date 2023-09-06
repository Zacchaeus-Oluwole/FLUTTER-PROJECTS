import 'package:flutter/material.dart';
import 'author_card.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 510,
          width: 380,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mag5.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0)
          ),
        ),

        child: Column(
          children: [
            const AuthorCard(
              authorName: "Zacchaeus Oluwole",
              title: "Smoothie Connoisseur",
              imageProvider: AssetImage("assets/zach.jpg"),
              ),

          ],
        ),
      ),
    );
  }
}