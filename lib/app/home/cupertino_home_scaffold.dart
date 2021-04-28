import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/tab_item.dart';

// know how to shot the bottom navigation on the screen

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold(
      {Key key, @required this.currentTab, @required this.onSelectedTab})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
