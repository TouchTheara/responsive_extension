import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1024
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 768
                ? (md ?? sm ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: context.responsive<int>(2, sm: 2, md: 3, lg: 4, xl: 5),
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        50,
        (int idx) => Card(
          color: Colors.teal[600],
          child: Center(child: Text('$idx')),
        ),
      ),
    );
  }
}

class MyWidget2 extends StatelessWidget {
  MyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: context.responsive<Widget>(
        mobileWidget, // default
        md: tabletWidget, // medium
        lg: desktopWidget, // large
      ),
    );
  }

  Widget mobileWidget = Column(children: [
    Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blueAccent,
        child: const Text('Mobile', style: TextStyle(fontSize: 24)),
      ),
    ),
    Expanded(
      flex: 5,
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: const Text('Mobile', style: TextStyle(fontSize: 24)),
      ),
    ),
    Expanded(
      flex: 7,
      child: Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text('Mobile', style: TextStyle(fontSize: 24)),
      ),
    ),
  ]);
  Widget tabletWidget = Column(children: [
    Expanded(
      flex: 5,
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blueAccent,
            child: const Text('Tablet', style: TextStyle(fontSize: 24)),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey,
            child: const Text('Tablet', style: TextStyle(fontSize: 24)),
          ),
        ),
      ]),
    ),
    Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text('Tablet', style: TextStyle(fontSize: 24)),
      ),
    ),
  ]);
  Widget desktopWidget = Row(children: [
    Expanded(
      flex: 4,
      child: Container(
        alignment: Alignment.center,
        color: Colors.blueAccent,
        child: const Text('Desktop', style: TextStyle(fontSize: 24)),
      ),
    ),
    Expanded(
      flex: 7,
      child: Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: const Text('Desktop', style: TextStyle(fontSize: 24)),
      ),
    ),
    Expanded(
      flex: 10,
      child: Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: const Text('Desktop', style: TextStyle(fontSize: 24)),
      ),
    ),
  ]);
}
