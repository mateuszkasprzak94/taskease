import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent,
      indicatorPadding: const EdgeInsets.all(7),
      indicator: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelColor: Colors.black,
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      tabs: const [
        Tab(
          text: 'Today',
        ),
        Tab(
          text: 'Upcoming',
        ),
        Tab(
          text: 'Task Done',
        ),
        Tab(
          text: 'Failed Task',
        ),
      ],
    );
  }
}
