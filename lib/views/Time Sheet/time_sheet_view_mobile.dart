/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/request_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/time_sheet_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/widgets/AttendanceWidget/AttendanceTile.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class TimeSheetMobilePortrait extends BaseModelWidget<TimeSheetViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, TimeSheetViewModel model) {
    TextEditingController _EmployeName = TextEditingController();
    TextEditingController _Day = TextEditingController();
    TextEditingController _Date = TextEditingController();
    TextEditingController _TimeIn = TextEditingController();
    TextEditingController _TimeOut= TextEditingController();


    var theme = Theme.of(context).textTheme;
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;



    return  SafeArea(
      child: Scaffold(
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
                    title: Text('Time Sheet', style: theme.titleLarge?.copyWith(color: Colors.white),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Task Sheet',style: theme.displayLarge?.copyWith(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: height*0.04,),


                        TextFormField(
                          controller: _EmployeName,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                            hintText: 'Employ name',
                            hintStyle: theme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600
                          ),
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _Day,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                            hintText: 'Day',
                            hintStyle: theme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600
                            ),
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _Date,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                            hintText: 'Date dd/mm/yyy',
                            hintStyle: theme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600
                            ),
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _TimeIn,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                            hintText: 'Time in',
                            hintStyle: theme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600
                            ),
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _TimeOut,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                            hintText: 'Time out',
                            hintStyle: theme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600
                            ),
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        Container(
                          height: height*0.07,
                          width: width*0.4,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.lightBlue,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 3.0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 5  horizontally
                                    0.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ]),


                          child: Center(child: Text('Submit',style: theme.displayMedium?.copyWith(
                              color: AppColor.textColor,
                              fontWeight: FontWeight.bold
                          ),)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

  ] )),
    );




}

}
class AttendanceMobileLandscape extends BaseModelWidget<RequestLetterViewModel> {
  @override
  Widget build(BuildContext context, RequestLetterViewModel model) {
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
