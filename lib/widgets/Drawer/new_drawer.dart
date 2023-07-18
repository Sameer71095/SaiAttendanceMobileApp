


import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/views/My%20Pay/my_pay_view.dart';
import 'package:ClockSpotter/views/My%20Profile/my_profile_view.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view.dart';
import 'package:ClockSpotter/views/Time%20Sheet/time_sheet_view.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:flutter/material.dart';

class NewDrawer extends StatefulWidget {
  const NewDrawer({super.key});

  @override
  State<NewDrawer> createState() => _NewDrawerState();
}

class _NewDrawerState extends State<NewDrawer> {


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return  Drawer(

      backgroundColor: Colors.blue.shade700,
      width: 200,

      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background/back.jpg')
          )
        ),
        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  ListTile(
                    trailing: Icon(
                      Icons.menu_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    title: const Text('Menu',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Attendance', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
                        transitionsBuilder: (context, animation, secondaryAnimation,
                            child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.timelapse_sharp,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Time Sheets', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (context, animation, secondaryAnimation) => TimeSheetView(),
                        transitionsBuilder: (context, animation, secondaryAnimation,
                            child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );

                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Time off', style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
                Divider(color: Colors.white,)
              ],
            ),

            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.request_page,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Letter Requests', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            RequestLetterView(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.people_alt,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'People', style: TextStyle(color: Colors.white),),
                  onTap: () {},
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'My Pay', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (context, animation, secondaryAnimation) => MyPayView(),
                        transitionsBuilder: (context, animation, secondaryAnimation,
                            child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.work_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Work Expense', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'My Profile', style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        pageBuilder: (context, animation, secondaryAnimation) => MyProfileView(),
                        transitionsBuilder: (context, animation, secondaryAnimation,
                            child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Log Out', style: TextStyle(color: Colors.white),),
                  onTap: () async {
                    await storage
                        .deleteAll(); // Delete all existing keys and values
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginView(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                Divider(color: Colors.white,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
