/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/my_profile_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/peoples_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
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

class PeoplesMobilePortrait extends BaseModelWidget<PeoplesViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    var theme = Theme.of(context).textTheme;
    double fontSize = 20;

    return SafeArea(
      child: Scaffold(
        drawer: NewDrawer(),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: AssetImage('assets/images/background/back.jpg'))),
            ),
            Column(

              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Container(),
                  title: Text(
                    'Peoples',
                    style: theme.titleLarge?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Team Members',
                      textAlign: TextAlign.center,
                      style: theme.displayLarge?.copyWith(
                        fontSize: 25,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: MediaQuery.of(context).size.width /
                                (MediaQuery.of(context).size.height / 1.6),
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                          ),
                          itemCount: 12,
                          itemBuilder: (BuildContext ctx, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height*0.11,
                                      width:width*0.6 ,

                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),
                                          ),
                                          ),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/home/place.png',
                                          height:height*0.07,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: height*0.01,),
                                Text(
                                  'Member Name',
                                  textAlign: TextAlign.center,
                                  style: theme.displaySmall?.copyWith(
                                    color: Colors.white
                                  ),
                                ),

                              ],
                            );
                          }),
                    ),
                  ),
                ),


                // Expanded(
                //
                //   child: Container(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: GridView.builder(
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 3,
                //           ),
                //           itemCount: 6,
                //           itemBuilder: (BuildContext ctx, index) {
                //             return Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: GestureDetector(
                //                 onTap: (){
                //                 },
                //                 child: Container(
                //                   width:10 ,
                //                   decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       border: Border.all(color: Colors.black),
                //                       borderRadius: BorderRadius.all(
                //                         Radius.circular(25.0),
                //                       ),
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Colors.black45,
                //                           blurRadius: 3.0, // soften the shadow
                //                           spreadRadius: 1.0, //extend the shadow
                //                           offset: Offset(
                //                             1.0, // Move to right 5  horizontally
                //                             3.0, // Move to bottom 5 Vertically
                //                           ),
                //                         )
                //                       ]),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Center(
                //                         child: Image.asset(
                //                           'assets/images/home/place.png',
                //                           fit: BoxFit.cover,
                //                         ),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.all(10.0),
                //                         child: Text(
                //                          'Name Member',
                //                           textAlign: TextAlign.center,
                //                           style: theme.displaySmall,
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           }),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PeoplesLandscape extends BaseModelWidget<PeoplesViewModel> {
  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
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
