import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app/features/pages/add_task_page/add_task_page.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/failed/failed.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/task_done/done.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/today/today.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/upcoming/upcoming.dart';
import 'package:to_do/app/features/pages/home_page/widgets/tab_info.dart';
import 'package:to_do/app/features/pages/home_page/widgets/tabbar.dart';
import 'package:to_do/app/features/pages/profile_page/profile_page.dart';
import 'package:to_do/app/injection_container.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

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
        child: BlocProvider<TabScreenCubit>(
          create: (context) => getIt()..start(),
          child: BlocBuilder<TabScreenCubit, TabScreenState>(
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: FadeInAnimation(
                                delay: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            builder: (context) => ProfilePage(
                                                email: widget.user.email),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.person),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: FadeInAnimation(
                              delay: 1.3,
                              child: Padding(
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
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: FadeInAnimation(
                              delay: 1.6,
                              child: TabInfo(),
                            ),
                          ),
                          const FadeInAnimation(
                              delay: 1.6, child: TabBarWidget()),
                          const Expanded(
                            flex: 11,
                            child: FadeInAnimation(
                              delay: 1.9,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 20,
                                  bottom: 80,
                                ),
                                child: TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    TodayTab(),
                                    UpcomingTab(),
                                    TaskDoneTab(),
                                    FailedTab(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const FadeInAnimation(
                        delay: 2.2,
                        child: AddTaskButton(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTask(),
              fullscreenDialog: true,
            ),
          );
        },
        label: const Text(
          'Add Task',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        icon: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
