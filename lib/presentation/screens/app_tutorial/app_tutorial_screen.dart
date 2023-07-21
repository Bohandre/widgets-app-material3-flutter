// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl,
  );
}

final slides = <SlideInfo>[
  SlideInfo(
    'Buca la comida',
    'Exercitation sunt voluptate irure ut adipisicing labore est aute.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Incididunt et eiusmod proident non enim deserunt aliquip minim.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Non anim tempor ut excepteur ipsum magna.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReach && page >= (slides.length) - 1.5) {
        setState(() {
          endReach = true;
        });
      }
      print('${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReach
              ? Positioned(
                  bottom: size.height * 0.03,
                  right: size.width * 0.05,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
