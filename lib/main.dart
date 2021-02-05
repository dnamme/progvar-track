import "package:flutter/material.dart";
import "./tab_home.dart";
import "./tab_records.dart";
import "./tab_profile.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ProgVar Tracker",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "ProgVar Tracker"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    RecordsTab(),
    ProfileTab(),
  ];

  void onTapped(int i) {
    setState(() {
      currentTabIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        selectedItemColor: Color(0xff191919),
        unselectedItemColor: Color(0xffa0a0a0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentTabIndex == 0 ? Icons.home : Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(currentTabIndex == 1
                ? Icons.insert_chart
                : Icons.insert_chart_outlined),
            label: "Records",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentTabIndex == 2 ? Icons.person : Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
