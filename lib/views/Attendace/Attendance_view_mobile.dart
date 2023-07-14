/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/AttendanceWidget/AttendanceTile.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class AttendanceMobilePortrait extends BaseModelWidget<AttendanceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, AttendanceViewModel model) {

    List myProductonTap = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        title: Text('Attendance'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade700,
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
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
                    'Attendance',
                    style: TextStyle(color: Colors.white),
                  ),
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
                Divider(
                  color: Colors.white,
                )
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
                    'Time Sheets',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                )
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
                    'Time off',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                )
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
                    'Letter Requests',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                )
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
                    'People',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                Divider(
                  color: Colors.white,
                )
              ],
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Work Expense',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.white,
                )
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
                    'My Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.white,
                )
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
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    await storage
                        .deleteAll(); // Delete all existing keys and values
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginView(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
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
                Divider(
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue.shade700,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white54,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
              Column(
              children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(15)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                child: Column(
                  children: [
                    Align(
                      alignment:Alignment.topLeft,
                        child: Text('DD/MM/YY')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shift Starts at ${constants.loginData.shiftStartTime}"),
                        Container(
                          child: Center(child: Text('Check In',style: TextStyle(color: Colors.red),)),
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade300,
                          ),

                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shift ends at ${constants.loginData.shiftEndTime}'),
                        Container(
                          child: Center(child: Text('Check Out',style: TextStyle(color: Colors.red),)),
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue.shade300,
                          ),

                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                    child: Text('History',style: TextStyle(fontSize: 30),)),
              ),

              ],
          ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.shade50,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),


                            child: Column(
                              children: [
                                Align(
                                    alignment:Alignment.topLeft,
                                    child: Text('DD/MM/YY',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),),
                                SizedBox(height: 5,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('shift Starts at 00:00 AM/PM',style: TextStyle(fontSize: 13),),
                                    Text('In:00:00')
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('shift Starts at 00:00 AM/PM',style: TextStyle(fontSize: 13),),
                                    Text('Out: 00:00')
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AttendanceMobileLandscape extends BaseModelWidget<AttendanceViewModel> {
  @override
  Widget build(BuildContext context, AttendanceViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondView(
                    key: new Key("test"),
                  )));
        },
      ),
      body: Row(
        children: <Widget>[
          const AppDrawer(),
          Expanded(
            child: Center(
              child: Text(
                model.title,
                style: const TextStyle(fontSize: 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
