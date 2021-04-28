import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/cupertino_home_scaffold.dart';
import 'package:time_tracker/app/home/tab_item.dart';

// this keeps track of the current opened tab

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectedTab: (item) {},
    );
  }
}
