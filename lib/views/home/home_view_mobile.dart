/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/Insurance/insurance_view.dart';
import 'package:ClockSpotter/views/My%20Pay/my_pay_view.dart';
import 'package:ClockSpotter/views/Peoples/peoples_view.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view.dart';
import 'package:ClockSpotter/views/Task%20Sheet/task_sheet_view.dart';
import 'package:ClockSpotter/views/Time%20Off/time_of_view.dart';
import 'package:ClockSpotter/views/Work%20Expense/work_expense_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view_mobile.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'dart:math' as math;


class HomeMobilePortrait extends BaseModelWidget<HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    List myProducts = [
      "assets/images/home/tick.png",
      "assets/images/home/letter.png",
      "assets/images/home/submit.png",
      "assets/images/home/add.png",
      "assets/images/home/beach.png",
      "assets/images/home/health.png"
    ];
    List myProductsText = [
      "Attendance check in/out",
      "Request a Letter",
      "submit work expenses",
      "Add New Task",
      "Request Time Off",
      'Health Insurance'
    ];
    List tile = [
      "assets/images/home/tick.png",
      "assets/images/home/timer.png",
      "assets/images/home/beach.png",
      "assets/images/home/letter.png",
      "assets/images/home/people.png",
      "assets/images/home/dollar.png",
      "assets/images/home/submit.png"
    ];
    List tileText = [
      "Attendance",
      "Tasksheets",
      "Time off",
      "Letter requests",
      "People",
      'My Pay',
      "Work Expense"
    ];
    List<String> screenNames = ['AttendanceView', 'Task Sheets','Time Off','Request Letter', 'Peoples','My Pay','Work Expense'];

    int currentScreenIndex = 0;


    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    var theme = Theme.of(context).textTheme;

      void navigateToScreenAtIndex(int index) {
        if (index >= 0 && index < screenNames.length) {
          currentScreenIndex = index;
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) {
                String currentScreenName = screenNames[currentScreenIndex];
                // Return the appropriate screen based on the currentScreenName
                // For example:
                switch (currentScreenName) {
                  case 'AttendanceView':
                    return AttendanceView();
                  case  'Task Sheets':
                    return TaskSheetView();
                  case 'Time Off':
                    return TimeOffView();
                  case 'Request Letter':
                    return RequestLetterView();
                  case 'Peoples':
                    return PeoplesView();
                  case 'My Pay':
                    return MyPayView();
                  case 'Work Expense':
                    return WorkExpenseView();
                  default:
                    return Container();
                }
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
        }}
    List<String> screenNamesGrid = ['AttendanceView','Request Letter','Work Expense','Task Sheets','Time Off', 'Insurance'];
    void navigateToScreenAtIndexGrid(int index) {
      if (index >= 0 && index < screenNamesGrid.length) {
        currentScreenIndex = index;
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              String currentScreenName = screenNamesGrid[currentScreenIndex];
              // Return the appropriate screen based on the currentScreenName
              // For example:
              switch (currentScreenName) {
                case 'AttendanceView':
                  return AttendanceView();
                case 'Request Letter':
                  return RequestLetterView();
                case 'Work Expense':
                  return WorkExpenseView();
                case 'Task Sheets':
                  return TaskSheetView();
                case 'Time Off':
                  return TimeOffView();
                case 'Insurance':
                  return InsuranceView();

                default:
                  return Container();
              }
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
      }}


    return SafeArea(
      child: Scaffold(

        drawer: DrawerView(),
        body: Stack(
          children: [
            Container(

              decoration: BoxDecoration(
                  color: AppColor.backgroundColor,

                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     alignment: Alignment.center,
                  //     image:AssetImage('assets/images/background/back.jpg')
                  // )
              ),),
            Positioned(
              top: height*0.377,
              child: Image.asset('assets/images/background/backRect.png',fit: BoxFit.cover,width: width,),

            ),
            Column(
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(color: AppColor.menuIconColor,size: 28),
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,

                    ),
                  ),
                  title: Text('Home',style: theme.titleLarge?.copyWith(
                    color: Colors.white
                  ),),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0,left: 10,right: 10),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height /2),
                          mainAxisSpacing:2,
                          crossAxisSpacing: 7,
                        ),
                        itemCount: myProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                navigateToScreenAtIndexGrid(index);
                              },
                              child: Container(
                                width:40,
                                decoration: BoxDecoration(
                                    color: AppColor.homeScreenIconColor,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(23.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 3.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 5  horizontally
                                          3.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        myProducts[index],
                                        height:MediaQuery.of(context).size.height*0.043,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:height*0.01,vertical: height*0.008),
                                      child: Text(
                                        myProductsText[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: theme.displaySmall,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: tile.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: AppColor.listViewColor,
                        child: Column(
                          children: [
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                              leading: SizedBox(
                                height: height * 0.095,
                                width: width * 0.095,
                                child: Image.asset(tile[index]),
                              ),
                              title: Text(
                                tileText[index],
                                style: theme.titleLarge?.copyWith(fontSize: 18),
                              ),
                              onTap: () {
                                navigateToScreenAtIndex(index);
                              },
                            ),
                            if(index!=tile.length-1)
                                Divider(
                                  thickness: 1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}
// class TrapezoidalClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height * 0.7);
//     path.lineTo(size.width, size.height * 0.9);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => SecondViewHome(
          //           key: new Key("test"),
          //         )));
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
