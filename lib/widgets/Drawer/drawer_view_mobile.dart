/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/drawer_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/Insurance/insurance_view.dart';
import 'package:ClockSpotter/views/My%20Pay/my_pay_view.dart';
import 'package:ClockSpotter/views/My%20Profile/my_profile_view.dart';
import 'package:ClockSpotter/views/Peoples/peoples_view.dart';
import 'package:ClockSpotter/views/Re-register%20Face/re_register_view.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view.dart';
import 'package:ClockSpotter/views/Task%20Sheet/task_sheet_view.dart';
import 'package:ClockSpotter/views/Time%20Off/time_of_view.dart';
import 'package:ClockSpotter/views/Work%20Expense/work_expense_view.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/views/leaveRequest/leaverequest_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';


class DrawerMobilePotrait extends BaseModelWidget<DrawerViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, DrawerViewModel model) {

    List tileText = [
      "Home",
      "Attendance",
      "Leave Request",
      "Tasks",
      "Time off",
      "Re-register Face",
      'Letter Requests',
      "People",
      "Insurance",
      "My Pay",
      "Work Expense",
      "My Profile",
      "Log Out"
    ];


    int currentScreenIndex = 0;
    List<IconData> tile = [
      Icons.home,
      Icons.people,
       Icons.timelapse_sharp,
      Icons.time_to_leave,
     Icons.timer,
      Icons.camera,
      Icons.request_page,
      Icons.people_alt_rounded,
    Icons.local_hospital_outlined,
     Icons.attach_money,
 Icons.work,
    Icons.person,
    Icons.logout,
    ];


    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    var theme = Theme.of(context).textTheme;
    List<String> screenNamesGrid = ['Home','AttendanceView','Leave Request', 'Task Sheets','Time Off','Re-register','Request Letter', 'Peoples','Insurance','My Pay','Work Expense','Profile','Logout'];
    // List<String> screenNamesGrid = ['AttendanceView','Request Letter','Work Expense','Task Sheets','Time Off', 'Insurance'];

    void navigateToScreenAtIndex(int index) {
      if (index >= 0 && index < screenNamesGrid.length) {
        currentScreenIndex = index;
        String currentScreenName = screenNamesGrid[currentScreenIndex];

        Widget destinationScreen;

        switch (currentScreenName) {
          case 'Home':
            destinationScreen = HomeView();
            break;
          case 'AttendanceView':
            destinationScreen = AttendanceView();
            break;
          case 'Leave Request':
            destinationScreen = LeaveRequestView();
            break;
          case  'Task Sheets':
            destinationScreen = TaskSheetView();
            break;
          case 'Time Off':
            destinationScreen = TimeOffView();
            break;
          case 'Re-register':
            destinationScreen = ReRegisterFaceView();
            break;
          case 'Request Letter':
            destinationScreen = RequestLetterView();
            break;
          case 'Peoples':
            destinationScreen = PeoplesView();
            break;
          case 'Insurance':
            destinationScreen = InsuranceView();
            break;
          case 'My Pay':
            destinationScreen = MyPayView();
            break;
          case 'Work Expense':
            destinationScreen = WorkExpenseView();
            break;
          case 'Profile':
            destinationScreen = MyProfileView();
            break;
          case 'Logout':
            destinationScreen = LoginView();
            break;
          default:
            destinationScreen = Container();
        }

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              return destinationScreen;
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
      }
    }


    return Drawer(

      backgroundColor: Colors.blue.shade700,
      width: 200,

      child: SafeArea(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  // image: DecorationImage(
                  //
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/images/background/back.jpg')
                  // )
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: Icon(
                          Icons.menu_outlined,
                          color: AppColor.menuIconColor,
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

                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      color: AppColor.backgroundColor,
                      child: ListView.builder(
                        itemCount: tile.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration:BoxDecoration(
                                  color:model.pressedIndex==index ?AppColor.tileColor:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),

                          ),
                                child: ListTile(


                                  visualDensity: VisualDensity(horizontal: -4, vertical: -1),
                                  leading:Icon(
                                     tile[index],
                                      color: model.pressedIndex==index? AppColor.iconColorBlack:AppColor.iconColorWhite,



                                  ),

                                  title: Text(tileText[index],style: theme.titleLarge?.copyWith(
                                      fontSize: 14,
                                    color: model.pressedIndex==index ?AppColor.textColorBlack:AppColor.textColorWhite,

                                  ),),

                                  onTap: () async{
                                    if(index==tile.length-1)
                                      await storage
                                        .deleteAll();
                                    model.toggleTileColor(index);

                                    navigateToScreenAtIndex(index);

                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );


  }


}

class DrawerMobileLandscape extends BaseModelWidget<DrawerViewModel> {
  @override
  Widget build(BuildContext context, DrawerViewModel model) {
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
