import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/pages/login_page.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title,this.nextPage});

  final String title;
  final Widget? nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage != null ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return nextPage!;
            },
          ),
        );
      }: null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'hero1',
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                // circular border radius for image
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/bg.jpg',
                  color: Colors.teal,
                  colorBlendMode: BlendMode.lighten,
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                letterSpacing: 50.0,
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}
