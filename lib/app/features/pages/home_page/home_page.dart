import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/app/features/pages/profile_page/profile_page.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime now;
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
    formattedDate = DateFormat.yMMMd().format(now);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage(user: widget.user),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Here's Today's Update",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const TabBar(
                  indicatorColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  tabs: [
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
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text('Today'),
                      ),
                      Center(
                        child: Text('Upcoming'),
                      ),
                      Center(
                        child: Text('Task Done'),
                      ),
                      Center(
                        child: Text('Failed Tasks'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
