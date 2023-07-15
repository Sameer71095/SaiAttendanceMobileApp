/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/request_viewmodel.dart';
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

class RequestLetterMobilePortrait extends BaseModelWidget<RequestLetterViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RequestLetterViewModel model) {
    TextEditingController _letterNameController = TextEditingController();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _dateController = TextEditingController();
    TextEditingController _dayController = TextEditingController();
    TextEditingController _signatureController = TextEditingController();


    var theme = Theme.of(context).textTheme;
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;



    return  Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text('Letter Request'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      drawer: NewDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text('Request Letter',style: theme.displayLarge?.copyWith(
                color: AppColor.textColor,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: height*0.04,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                          child: Text('Letter name',style: theme.displayMedium?.copyWith(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        TextFormField(
                          controller: _letterNameController,
                          decoration: InputDecoration(
                            hintText: 'Letter name',
                            filled: true,
                            fillColor: AppColor.fieldColor,

                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                          child: Text('Name',style: theme.displayMedium?.copyWith(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _firstNameController,
                                decoration: InputDecoration(
                                  hintText: 'First name',
                                  filled: true,
                                  fillColor: AppColor.fieldColor,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  hintText: 'Last name',
                                  filled: true,
                                  fillColor: AppColor.fieldColor,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                                child: Text('Date',style: theme.displayMedium?.copyWith(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                              TextFormField(
                                controller: _dateController,
                                decoration: InputDecoration(
                                  hintText: 'MM/DD/YY',
                                  filled: true,
                                  fillColor: AppColor.fieldColor,

                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //
                        //     children: [
                        //       Padding(
                        //         padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                        //         child: Text('Day',style: theme.displayMedium?.copyWith(
                        //           color: AppColor.textColor,
                        //           fontWeight: FontWeight.bold,
                        //         ),),
                        //       ),
                        //       TextFormField(
                        //         controller: _dayController,
                        //         decoration: InputDecoration(
                        //           hintText: 'MTWTFSS',
                        //           filled: true,
                        //           fillColor: AppColor.fieldColor,
                        //
                        //           border: OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //             borderRadius: BorderRadius.circular(10.0),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                          child: Text('Signature',style: theme.displayMedium?.copyWith(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        TextFormField(
                          controller: _signatureController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor.fieldColor,

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                          ),
                        ),
                      ],
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
      ),
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
