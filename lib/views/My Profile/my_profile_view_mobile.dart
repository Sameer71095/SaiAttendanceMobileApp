/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/my_profile_viewmodel.dart';
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

class MyProfileMobilePortrait extends BaseModelWidget<MyProfileViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, MyProfileViewModel model) {
    double height=MediaQuery.of(context).size.height;



    return Scaffold(
      drawer: NewDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    image:AssetImage('assets/images/background/back.jpg')
                )
            ),),
          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(


                          image: AssetImage('assets/images/background/back.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight
                      ),
                    ),
                  ),
                  title: Text('My Profile'),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Container(
                      height: height*0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(20)
                      ),
                      margin: EdgeInsets.only(top: 100),
                      child: Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Company Name',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Designation',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Nationality',
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Location',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ),

                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }


}

class HomeMobileLandscape extends BaseModelWidget<MyProfileViewModel> {
  @override
  Widget build(BuildContext context, MyProfileViewModel model) {
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
