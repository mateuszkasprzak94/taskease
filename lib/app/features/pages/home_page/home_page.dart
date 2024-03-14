import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/failed/failed.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/task_done/done.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/today/today.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/upcoming/upcoming.dart';
import 'package:to_do/app/features/pages/home_page/widgets/tabbar.dart';
import 'package:to_do/app/features/pages/profile_page/profile_page.dart';

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
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
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
                    const TabBarWidget(),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          TodayTab(),
                          UpcomingTab(),
                          TaskDoneTab(),
                          FailedTab(),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(onPressed: () {}, child: Text('ADD')),
                )
              ],
            ),
          ),
        ),
      );
}
