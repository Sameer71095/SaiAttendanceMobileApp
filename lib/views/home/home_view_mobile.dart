/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/Insurance/insurance_view.dart';
import 'package:ClockSpotter/views/My%20Pay/my_pay_view.dart';
import 'package:ClockSpotter/views/Peoples/peoples_view.dart';
import 'package:ClockSpotter/views/Request%20Letter/Request_view.dart';
import 'package:ClockSpotter/views/Task%20Sheet/task_sheet_view.dart';
import 'package:ClockSpotter/views/Time%20Off/time_of_view.dart';
import 'package:ClockSpotter/views/Work%20Expense/work_expense_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import 'home_view.dart';

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
      "Work expenses"
    ];
    List<String> screenNames = ['AttendanceView', 'Task Sheets','Time Off','Request Letter', 'Peoples','My Pay','Time Sheets'];

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
            Column(
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
                  title: Text('Work',style: theme.titleLarge?.copyWith(
                    color: Colors.white
                  ),),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height /2),
                          mainAxisSpacing:4,
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
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25.0),
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
                                        height:MediaQuery.of(context).size.height*0.04,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: tile.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                              leading: SizedBox(

                                  height: height*0.095,
                                  width:width*0.095 ,
                                  child: Image.asset(tile[index],)),
                              title: Text(tileText[index],style: theme.titleLarge?.copyWith(
                                fontSize: 18
                              ),),
                              onTap: () {
                                navigateToScreenAtIndex(index);

                              },
                            ),
                            Divider(thickness: 1,)
                          ],
                        );
                      },
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

//   return Scaffold(
//     body: Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Stack(
//         children: <Widget>[
//           Padding(
//               padding: const EdgeInsets.only(left: 60, top: 60),
//               child: model.button1 ? _buildPageWidget(model) : Container()),
//
//           ///
//           ///
//           /// Create Appbar
//           ///
//           ///
//           Align(
//             alignment: Alignment.topCenter,
//             child: Padding(
//               padding:
//               const EdgeInsets.only(top: 40.0, left: 80.0, right: 20.0),
//               child: _customAppBar(model),),),
//           Container(
//             color: HexColor('484848'),
//             height: MediaQuery.of(context).size.height,
//             width: 60,
//             padding: const EdgeInsets.only(top: 25),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(PageRouteBuilder(
//                         pageBuilder: (_, __, ___) =>
//                         drawerProfileScreen()));
//                   },
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     margin: const EdgeInsets.only(bottom: 16, top: 17.0),
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(12),
//                       ),
//                       color: Colors.white,
//                     ),
//                     child: const Center(
//                       child: Icon(Icons.menu),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           ///
//           ///
//           /// Create left bottom nav bar
//           ///
//           ///
//           Positioned(
//             bottom: 200,
//             child: Transform.rotate(
//               angle: 3.141592653589793 / 2,
//               alignment: Alignment.topLeft,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       _buildMenu("Fash Food", 0,model),
//                       _buildMenu("Healty Food", 1,model),
//                     ],
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 250),
//                     margin: EdgeInsets.only(left: model.paddingLeft),
//                     width: 150,
//                     height: 75,
//                     child: Stack(
//                       children: <Widget>[
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: ClipPath(
//                             clipper: AppClipper(),
//                             child: Container(
//                               width: 150,
//                               height: 60,
//                               color: HexColor('484848'),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Transform.rotate(
//                             angle: 3.141592653589793 / 2,
//                             child: const Padding(
//                               padding: EdgeInsets.only(right: 40),
//                               child: Icon(
//                                 Icons.arrow_forward_ios,
//                                 color: Colors.white,
//                                 size: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _buildMenu(String menu, int index,HomeViewModel model) {
//   return GestureDetector(
//     onTap: () {
//       model.buildMenu(index);
//     },
//     child: Container(
//       width: 150,
//       padding: const EdgeInsets.only(top: 16),
//       child: Center(
//         child: Text(
//           menu,
//           style: const TextStyle(
//               fontSize: 18, color: Colors.white, fontFamily: "Sofia"),
//         ),
//       ),
//     ),
//   );
// }

// Widget _customAppBar(HomeViewModel model) {
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         RichText(
//           text: TextSpan(
//             text: "Hello,\n",
//             style: const TextStyle(
//                 color: Colors.black, fontFamily: "Sofia", fontSize: 17.0),
//             children: [
//               TextSpan(
//                 text: constants.loginData.name,
//                 style: TextStyle(
//                   color: HexColor('f47320'),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 19.0,
//                   height: 1.0,
//                 ),
//               )
//             ],
//           ),
//         ),
//         const SizedBox(width: 16),
//         Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//             /*  image: DecorationImage(
//                   image: CachedNetworkImageProvider(
//                     "https://media.licdn.com/dms/image/C5603AQFs8d7ns-mD2g/profile-displayphoto-shrink_400_400/0/1605026303861?e=1683763200&v=beta&t=_ngBHfnnyWfAJbrvL9MsdlG3VR7c48YsHaiSg0043Ww",
//                   ),
//                   fit: BoxFit.cover),*/
//               borderRadius: BorderRadius.all(Radius.circular(150.0))),
//         ),
//       ],
//     ),
//   );
// }

//   Widget _buildPageWidget(HomeViewModel model) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 25),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Center(child:
//           Container(
//             height: 130.0,
//             width: MediaQuery.of(model.context).size.width-15,
//             margin: const EdgeInsets.only(
//                 top: 20,
//                 bottom: 20,
//                 left: 10,
//                 right: 10
//
//             ),
//             padding: const EdgeInsets.only(
//                 left: 5, top: 20.0, right: 5),
//             decoration: BoxDecoration(
//               color: const Color(0xFF5FBD84).withOpacity(0.1),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(32),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//
//                     Text(
//                       DateFormat('dd MMM yyyy').format(DateTime.now()),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           fontFamily: "Sofia"),
//
//                     ),
//                     const SizedBox(height: 16.0),
//                     Text(
//                       'Shift Starts at ${constants.loginData.shiftStartTime}' ,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                           fontFamily: "Sofia"),
//
//                     ),
//                     const SizedBox(height: 5.0),
//                     Text(
//                       'Shift ends at ${constants.loginData.shiftEndTime}' ,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.normal,
//                           fontSize: 16,
//                           fontFamily: "Sofia"),
//
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     RichText(
//                       text: TextSpan(
//                         children: [
//                           /*TextSpan(
//                                 text: 'Status:\n',
//                                 style: TextStyle(fontSize: 16.0, color: Colors.black),
//                               ),*/
//                           TextSpan(
//                             text: constants.loginData.isCheckedout ?? false ? "Checked-out" : "Checked-In",
//                             style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16.0),
//                     model.isLoading
//                         ? const CircularProgressIndicator()
//                         : model.isCheckedIn
//                         ? GestureDetector(
//                       onTap: () {
//                         // Handle container click
//                         //     model.loginClicked();
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           color: HexColor('#f56624'),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child:   Container(
//                           width: 100,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: HexColor('484948'),
//                           ),
//                           child: const Center(
//                             child: AutoSizeText("Check-Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                           ),
//                         ),),)
//
//                         :  GestureDetector(
//                       onTap: () {
//                         // Handle container click
//                         //     model.loginClicked();
//                         model.onCheckInClicked();
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           color: HexColor('#f56624'),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child:   Container(
//                           width: 100,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: HexColor('484948'),
//                           ),
//                           child: const Center(
//                             child: AutoSizeText("Tap", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                           ),
//                         ),),),
//
//                   ],
//                 ),
//               ],
//             ),
//
//           ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(left: 40),
//             child: Text(
//               "History",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 21,
//                   fontFamily: "Sofia"),
//             ),
//           ),
//
//           Expanded(
//             child: _buildList(model),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildList(HomeViewModel model) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scrollInfo) {
//         if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
//           //  model.loadMore(); // Function to load more data when the list reaches the end
//         }
//         return true;
//       },
//       child: RefreshIndicator(
//         onRefresh: model.onRefresh,
//         color:  Colors.brown,
//         child: ValueListenableBuilder<bool>(
//           valueListenable: model.dataLoaded,
//           builder: (BuildContext context, bool dataLoaded, Widget? child) {
//             if (!dataLoaded) {
//               model.loadData();
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: model.attendanceList.data!.length,
//                 padding: const EdgeInsets.only(
//                   left: 40,
//                   bottom: 16,
//                   right: 5,
//                   top: 20,
//                 ),
//                 itemBuilder: (context, index) {
//                   final attendance = model.attendanceList.data![index];
//                   return InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding: const EdgeInsets.only(left: 8, top: 10.0, bottom: 10.0),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF5FBD84).withOpacity(0.1),
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           bottomLeft: Radius.circular(12),
//                         ),
//                       ),
//                       child: AttendanceTile(
//                         name: attendance.employeeName!,
//                         date: attendance.checkedDate!,
//                         totalHours: attendance.totalHours!, // Update this value based on your data calculation
//                         timeEntries: attendance.checked
//                         !.map((e) => {
//                           e.isCheckedout: e.checkedTime!,
//                           /*   'out': e.isCheckedout ? 'checked out' : null,*/
//                         })
//                             .toList(),
//                       ),
//                     ),
//
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//
// }
}

class HomeMobileLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SecondViewHome(
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
