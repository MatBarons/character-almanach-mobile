import 'package:character_almanach_mobile/widgets/infinite-carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InfiniteCarousel()
    );
  }
}