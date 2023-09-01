/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape


import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/time_off_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';

import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class TimeOffMobilePortrait extends BaseModelWidget<TimeOffViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, TimeOffViewModel model) {


    var theme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> list = [
      {
        'day': 'Monday',
        'date': '2023-07-17',
        'timeIn': '08:30 AM',
        'timeOut': '05:00 PM',
      },
      {
        'day': 'Tuesday',
        'date': '2023-07-18',
        'timeIn': '09:00 AM',
        'timeOut': '06:00 PM',
      },
      {
        'day': 'Wednesday',
        'date': '2023-07-18',
        'timeIn': '09:00 AM',
        'timeOut': '06:00 PM',
      },
      {
        'day': 'Thursday',
        'date': '2023-07-18',
        'timeIn': '09:00 AM',
        'timeOut': '06:00 PM',
      },
      {
        'day': 'Friday',
        'date': '2023-07-18',
        'timeIn': '09:00 AM',
        'timeOut': '06:00 PM',
      },
      {
        'day': 'Saturday',
        'date': '2023-07-18',
        'timeIn': '09:00 AM',
        'timeOut': '06:00 PM',
      },

      // Add more rows here
    ];
    double font=12;
    double vertical= height*0.032;

    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          model.willPopScopeNavigation();
          return true;

        },
        child: Scaffold(
            drawer: DrawerView(),
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     alignment: Alignment.center,
                    //     image: AssetImage('assets/images/background/back.jpg'))
                ),
              ),
              Column(
                children: [
                  AppBar(
                    iconTheme: IconThemeData(color: AppColor.menuIconColor,size: 28),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/background/back.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topRight),
                      ),
                    ),
                    title: Text(
                      'Time Off',
                      style: theme.titleLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Table(
                     border: TableBorder.all(color: Colors.white,width: 2),
                     children: [
                       TableRow(
                           children: [
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('Day',style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                   fontWeight: FontWeight.bold
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('Date',style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('Time in',style: theme.displaySmall?.copyWith(
                                     color: Colors.white
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('Time out',style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                   fontSize: font
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('Total Hours',style: theme.displaySmall?.copyWith(
                                     color: Colors.white
                                 ),),
                               ),
                             ),



                           ]
                       ),
                       for (var item in list)
                         TableRow(
                           children: [
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text(item['day'],style: theme.displaySmall?.copyWith(
                                   color: Colors.white,
                                   fontWeight: FontWeight.normal
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text(item['date'],style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                     fontWeight: FontWeight.normal
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text(item['timeIn'],style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                     fontWeight: FontWeight.normal
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text(item['timeOut'],style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                     fontWeight: FontWeight.normal
                                 ),),
                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(

                               ),
                               margin: EdgeInsets.symmetric(vertical: vertical),
                               child: Center(
                                 child: Text('2',style: theme.displaySmall?.copyWith(
                                     color: Colors.white,
                                     fontWeight: FontWeight.normal
                                 ),),
                               ),
                             ),



                           ]
                         )


                     ],
                   ),
                 ),



                ],

              ),
              SizedBox(height: height*0.04,),


              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text('Employ Signature: ',style: theme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: width*0.05,),
                        Column(
                          children: [
                            Text('Sameer Masood',style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )),
                            Text("_______________",style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Manger Signature: ',style: theme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        )),
                        SizedBox(width: width*0.05,),
                        Column(
                          children: [
                            Text('Sameer Masood',style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            )),
                            Text("_______________",style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.01,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text('Total Payment: ',style: theme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: width*0.05,),

                        Column(
                          children: [
                            Text("50000",style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),


                            Text("________________",style: theme.displayMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height*0.03,)

                ],

              ),
            ])),
      ),
    );
  }
}


class TimeOffMobileLandscape extends BaseModelWidget<TimeOffViewModel> {
  @override
  Widget build(BuildContext context, TimeOffViewModel model) {
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
