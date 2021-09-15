import 'package:flutter/material.dart';
import 'package:stack_images/pages/stack.dart';

class StackPage2 extends StatefulWidget {
  const StackPage2({Key? key}) : super(key: key);

  @override
  _StackPage2State createState() => _StackPage2State();
}

class _StackPage2State extends State<StackPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Stacked Images 2'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildExpandedBox(
              color: Colors.greenAccent,
              children: [
                buildStackedImages(),
                const SizedBox(height: 16),
                buildStackedImages(direction: TextDirection.rtl),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpandedBox({
    required List<Widget> children,
    required Color color,
  }) =>
      Expanded(
        child: Container(
          color: color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      );

  Widget buildStackedImages({
    TextDirection direction = TextDirection.ltr,
  }) {
    const double size = 100;
    const double xShift = 20;
    final urlImages = [
      'https://images.pexels.com/photos/3791466/pexels-photo-3791466.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      'https://images.pexels.com/photos/853199/pexels-photo-853199.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
      'https://images.pexels.com/photos/1379636/pexels-photo-1379636.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    const double borderSize = 5;

    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
