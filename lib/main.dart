import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/screens/home/home_screen.dart';
import 'package:dismissible_page/dismissible_page.dart';

void main() {
  runApp(const MyApp());
}

// Required for desktop mouse swipes to work!
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: AppScrollBehavior(),

      debugShowCheckedModeBanner: false,
      // home: AppView(),
      home: HomeScreen(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: AppHome());
}

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  final stories = [
    StoryModel(title: 'STORY'),
    StoryModel(title: 'STORY'),
    StoryModel(title: 'STORY'),
    StoryModel(title: 'STORY'),
    StoryModel(title: 'STORY'),
    StoryModel(title: 'STORY'),
  ];

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Dismissible', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int i) => StoryWidget(story: stories[i]),
                separatorBuilder: (_, int i) => SizedBox(width: 10),
                itemCount: stories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  final StoryModel story;

  const StoryWidget({required this.story});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransparentRoute(StoryPage(story: story));
      },
      child: Hero(
        tag: story.storyId,
        child: Container(
          height: 120,
          width: 88,
          padding: const EdgeInsets.all(8),
          child: Text(
            story.title,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Colors.white),
          ),
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(story.imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatelessWidget {
  final StoryModel story;
  const StoryPage({required this.story});

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismiss: () => Navigator.of(context).pop(),
      isFullScreen: false,
      dragSensitivity: .4,
      maxTransformValue: 4,
      direction: DismissDirection.vertical,
      child: Material(
        color: Colors.transparent,
        child: Hero(
          tag: story.storyId,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              story.title,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            ),
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(story.imageUrl),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StoryModel {
  final storyId = UniqueKey();
  final String title;
  String imageUrl;

  String get nextVehicleUrl =>
      'https://source.unsplash.com/collection/1989985/${Random().nextInt(20) + 400}x${Random().nextInt(20) + 800}';

  StoryModel({required this.title, this.imageUrl = ""}) {
    imageUrl = nextVehicleUrl;
  }
}
