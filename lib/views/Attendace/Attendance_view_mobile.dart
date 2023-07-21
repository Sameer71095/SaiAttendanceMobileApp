/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/utils/ui_utils.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
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

class AttendanceMobilePortrait extends BaseModelWidget<AttendanceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, AttendanceViewModel model) {
    var theme = Theme.of(context).textTheme;

    List myProductonTap = [];

    return SafeArea(
      child: Builder(
        builder: (BuildContext context) {
          final MediaQueryData mediaQuery = MediaQuery.of(context);

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
                      title: Text('Attendance'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColor.ContainerBackground
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [

                                ///
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                                    child: _customAppBar(model),),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(

                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.containercolor,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text( DateFormat('dd MMM yyyy').format(DateTime.now()),style: theme.titleSmall,),
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    Text(
                                                      'Shift ends at ${constants.loginData.shiftEndTime}',style: theme.displayMedium,
                                                    ),
                                                    SizedBox(height: 10,),
                                                    Text(
                                                      "Shift Starts at ${constants.loginData.shiftStartTime}",style: theme.displayMedium,
                                                    ),

                                                  ],

                                                ),

                                                InkWell(
                                                  onTap: (){
                                                    model.onCheckInClicked();
                                                  },
                                                  child: Container(
                                                    child: Center(
                                                      child: Text(
                                                          'Tap',
                                                          style: theme.headlineSmall?.copyWith(
                                                              color: Colors.white
                                                          )
                                                      ),
                                                    ),
                                                    height: 30,
                                                    width: 90,
                                                    decoration: BoxDecoration(

                                                      borderRadius:
                                                      BorderRadius.circular(10),


                                                      color: AppColor.tapColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),



                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'History',
                                            style:theme.displayLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: _buildList(model),
                                  // child: LayoutBuilder(
                                  //   builder: (BuildContext context,
                                  //       BoxConstraints constraints) {
                                  //     return ListView.builder(
                                  //       shrinkWrap: true,
                                  //       physics: const BouncingScrollPhysics(),
                                  //       itemCount:10,
                                  //       itemBuilder: (context, index) {
                                  //         return Padding(
                                  //           padding: const EdgeInsets.only(bottom: 10),
                                  //           child: Container(
                                  //             decoration: BoxDecoration(
                                  //               color: AppColor.containercolor,
                                  //               borderRadius: BorderRadius.circular(15),
                                  //             ),
                                  //             padding: EdgeInsets.symmetric(
                                  //                 horizontal: 10, vertical: 10),
                                  //             child: Column(
                                  //               children: [
                                  //                 Align(
                                  //                   alignment: Alignment.topLeft,
                                  //                   child: Text(
                                  //                     'DD/MM/YY',
                                  //                     style: TextStyle(
                                  //                         fontSize: 15,
                                  //                         fontWeight: FontWeight.bold),
                                  //                   ),
                                  //                 ),
                                  //                 SizedBox(height: 5),
                                  //                 Row(
                                  //                   mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceBetween,
                                  //                   children: [
                                  //                     Text(
                                  //                       'shift Starts at 00:00 AM/PM',
                                  //                       style: TextStyle(fontSize: 13),
                                  //                     ),
                                  //                     Text('In:00:00'),
                                  //                   ],
                                  //                 ),
                                  //                 SizedBox(height: 5),
                                  //                 Row(
                                  //                   mainAxisAlignment:
                                  //                   MainAxisAlignment.spaceBetween,
                                  //                   children: [
                                  //                     Text(
                                  //                       'shift Starts at 00:00 AM/PM',
                                  //                       style: TextStyle(fontSize: 13),
                                  //                     ),
                                  //                     Text('Out: 00:00'),
                                  //                   ],
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   },
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


              ],

            ),
          );
        },
      ),
    );
  }

  Widget _customAppBar(AttendanceViewModel model) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Hello\n",
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Sofia", fontSize: 20.0),

                children: [

                  TextSpan(
                    text:constants.loginData.name,
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      height: 1.0,
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildList(AttendanceViewModel model) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          //  model.loadMore(); // Function to load more data when the list reaches the end
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: model.onRefresh,
        color:  Colors.blueAccent,
        child: ValueListenableBuilder<bool>(
          valueListenable: model.dataLoaded,
          builder: (BuildContext context, bool dataLoaded, Widget? child) {
            if (!dataLoaded) {
              model.loadData();
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: model.attendanceList.data!.length,

                itemBuilder: (context, index) {
                  final attendance = model.attendanceList.data![index];
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(

                        decoration: BoxDecoration(
                          color:AppColor.containercolor,
                          borderRadius:  BorderRadius.circular(15)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: AttendanceTile(
                            name: attendance.employeeName!,
                            date: attendance.checkedDate!,
                            totalHours: attendance.totalHours!, // Update this value based on your data calculation
                            timeEntries: attendance.checked
                            !.map((e) => {
                              e.isCheckedout: e.checkedTime!,
                              /*   'out': e.isCheckedout ? 'checked out' : null,*/
                            })
                                .toList(),
                          ),
                        ),
                      ),
                    ),

                  );
                },
              );
            }
          },
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
