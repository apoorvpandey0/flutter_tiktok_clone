import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.deepPurple,
    Colors.brown,
    Colors.grey,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(initialPage: 1);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Scroll down'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            itemCount: _colors.length,
            controller: _controller,
            itemBuilder: (context, index) => Container(
              color: _colors[index],
              child: Text(index.toString()),
            ),
            scrollDirection: Axis.vertical,
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: kBottomNavigationBarHeight + 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(""),
                            ),
                            Container(
                              // color: Colors.pink,
                              margin: const EdgeInsets.only(right: 10),
                              width: 50,
                              height: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.volume_off_outlined,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share_outlined,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                        // Container(
                        //   color: Colors.lightBlue,
                        //   height: 80,
                        //   child: Row(
                        //     children: [Text("Botom row")],
                        //   ),
                        // )
                      ],
                    ),
                  )))
        ],
      ),

      bottomNavigationBar: BottomNavBar(),
      //     ,
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ]);
  }
}
