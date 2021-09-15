import 'package:flutter/material.dart';
import 'package:stack_images/pages/stackpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Stacked Images';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primaryColor: Colors.black),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
      child: const Text(
        'Go to Stack',
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StackPage()),
          ));
}
