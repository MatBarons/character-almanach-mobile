import 'package:character_almanach_mobile/widgets/character-card.dart';
import 'package:flutter/material.dart';

class InfiniteCarousel extends StatefulWidget {
  const InfiniteCarousel({super.key});

  @override
  State<InfiniteCarousel> createState() => _InfiniteCarouselState();
}

class _InfiniteCarouselState extends State<InfiniteCarousel> {
  static const int realItemCount = 5;
  static const int initialPage = 10000;

  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      viewportFraction: 0.75,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int getRealIndex(int index) {
    return index % realItemCount;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        final realIndex = getRealIndex(index);

        return AnimatedBuilder(
          animation: controller,
          child: CharacterCard(index: realIndex),
          builder: (context, child) {
            double value = 0;

            if (controller.position.haveDimensions) {
              value = (controller.page ?? initialPage.toDouble()) - index.toDouble();
              value = (value.abs() * 0.3).clamp(0.0, 1.0);
            }

            final scale = 1 - value;
            final opacity = (1 - value * 0.5).clamp(0.5, 1.0);
            final verticalOffset = value * 30;

            return Center(
              child: Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: Offset(0, verticalOffset),
                  child: Transform.scale(
                    scale: scale,
                    child: child,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

