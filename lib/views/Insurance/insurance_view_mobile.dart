/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Insurance_viewmodel.dart';

import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/home/home_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';

import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class InsuranceMobilePortrait extends BaseModelWidget<InsuranceViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, InsuranceViewModel model) {
    var theme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double fontSize = 15;

    // final List<Map<String, dynamic>> list = [
    //   {
    //     'name': 'Muhammad',
    //     'date from': '12/12/12',
    //     'time till': '12/12/12',
    //   },
    //
    //   // Add more rows here
    // ];

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {

         model.willPopScopeNavigation();
          return true;
        },
        child: Scaffold(
          appBar:   AppBar(


            iconTheme: IconThemeData(color: AppColor.menuIconColor,size: 28),
            centerTitle: true,

            backgroundColor: AppColor.backgroundColor,
            elevation: 0,
            flexibleSpace: Container(

              decoration: BoxDecoration(
                color: AppColor.backgroundColor,

                // image: DecorationImage(
                //     image:
                //         AssetImage('assets/images/background/back.jpg'),
                //     fit: BoxFit.cover,
                //     alignment: Alignment.topRight),
              ),
            ),
            title: Text(
              'Health Insurance',
              style: theme.titleLarge?.copyWith(color: Colors.white),
            ),
          ),

            drawer: DrawerView(),
            body: Stack(
                children: [
              Container(
                decoration: BoxDecoration(
                color: AppColor.backgroundColor
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     alignment: Alignment.center,
                    //     image: AssetImage('assets/images/background/back.jpg'),
                    )),

              SingleChildScrollView(
                child: Column(
                  children: [

                    Text('Insurance Certificate',style: theme.displayLarge?.copyWith(
                      fontSize: 26,
                        color: AppColor.textColor,
                        fontWeight: FontWeight.bold
                    ),),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 13),
                                  child: Card(

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 10,
                                    shadowColor: Colors.grey,
                                    color: AppColor.backgroundContainer,

                                    child: SizedBox(
                                      width: double.infinity,
                                      height: model.expandedIndex == true
                                          ? height * 0.86
                                          : height * 0.49,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5),
                                              child: Image.asset(     'assets/images/home/Insurance.jpeg',height: height*0.233,width: width,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height*0.02,
                                            ),

                                            Text(
                                              'Muhammad Masood',
                                              // team.name.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,

                                                fontSize: 20,
                                                color: AppColor.backgroundColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height*0.01,
                                            ),


                                            SizedBox(
                                              width: width*0.3,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  model.toggleDetail();
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                  MaterialStateProperty.all(
                                                      AppColor.backgroundColor),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.touch_app),
                                                    Text('Details'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height*0.02,
                                            ),
                                            if (model.expandedIndex ==true)
                                              Container(
                                                height: height * 0.386,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(
                                                            0.5), // shadow color
                                                        spreadRadius:
                                                        2, // how spread out the shadow is
                                                        blurRadius:
                                                        5, // how blurry the shadow is
                                                        offset: Offset(
                                                            0, 1), // offset of the shadow
                                                      ),
                                                    ],
                                                    color: AppColor.backgroundContainerSmall,
                                                    borderRadius:
                                                    BorderRadius.circular(20)),
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Rushtech360',style: theme.displayLarge?.copyWith(
                                                            fontSize: 16,
                                                            color: AppColor.textColorBlack,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Name: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:'Muhammad Masood',
                                                                  // team.name.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Insurance Card: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:'000-000-000',
                                                                  // team.name.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'From: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:'15-Aug-23',
                                                                  // team.name.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'To: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:'14-Aug-24',
                                                                  // team.name.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Category: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize - 1,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                               text: 'C',
                                                                  // text: team.phoneNumber.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'YOB: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text:'1995',

                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Emp ID: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                text: "55",

                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Regulator ID: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: fontSize,
                                                                color: Colors.black),
                                                            children: <TextSpan>[
                                                              TextSpan(
                                                                  text:'000-000-000',
                                                                  // team.email.toString(),
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight
                                                                          .normal)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ) ,
                          ),
                        ],
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //
                    //     children: [
                    //       Text('Insured Signature: ',style: theme.displayMedium?.copyWith(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold
                    //       ),),
                    //       SizedBox(width: width*0.05,),
                    //       Column(
                    //         children: [
                    //           Text('Sameer',style: theme.displayMedium?.copyWith(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold
                    //           )),
                    //           Text("_______________",style: theme.displayMedium?.copyWith(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold
                    //           ))
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // )


                  ],
                ),
              ),
            ])),
      ),
    );
  }

}

// class MyTable extends StatelessWidget {
//
//   // Sample data
//   final List<Map<String, String>> tableData = [
//     {
//       'name': 'John Doe',
//       'dateFrom': '2023-07-01',
//       'dateTill': '2023-07-15',
//     },
//
//     // Add more data rows here as needed...
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context).textTheme;
//     double vertical = 18;
//     double font = 14;
//
//
//     return Table(
//       border: TableBorder.all(color: Colors.white),
//       columnWidths: {
//         0: FlexColumnWidth(2), // Adjust the width of the first column
//         1: FlexColumnWidth(3), // Adjust the width of the second column
//       },
//       children: [
//         TableRow(
//           children: [
//             TableCell(
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(vertical: vertical),
//                 child: Center(
//                   child: Text('Name',style: theme.displaySmall?.copyWith(
//                   color: Colors.white,
//                       fontSize: font,
//                       fontWeight: FontWeight.bold
//                   ),),
//                 ),
//               ),
//             ),
//             TableCell(
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(vertical: vertical),
//                 child: Center(
//                   child: Text(
//                     'Muhammad',
//                     style: theme.displaySmall?.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.normal,
//                       fontSize: font
//
//                     ),
//
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // Generate the table rows dynamically from the data list
//         ...tableData.map((data) {
//           return TableRow(
//             children: [
//               TableCell(
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(vertical: vertical),
//                   child: Center(
//                     child: Text('Date From' ,style: theme.displaySmall?.copyWith(
//           color: Colors.white,
//                         fontSize: font,
//
//                         fontWeight: FontWeight.bold),),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(vertical: vertical),
//                   child: Center(
//                     child: Text(data['dateFrom'] ?? '',style: theme.displaySmall?.copyWith(
//                         color: Colors.white,
//                         fontSize: font,
//
//                         fontWeight: FontWeight.normal
//                     ),),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }).toList(),
//         ...tableData.map((data) {
//           return TableRow(
//             children: [
//               TableCell(
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(vertical: vertical),
//                   child: Center(
//                     child: Text('Date Till', style: theme.displaySmall?.copyWith(
//                         color: Colors.white,
//                         fontSize: font,
//
//                         fontWeight: FontWeight.bold),),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(vertical: vertical),
//                   child: Center(
//                     child: Text(data['dateTill'] ?? '',style: theme.displaySmall?.copyWith(
//                         color: Colors.white,
//                         fontSize: font,
//
//                         fontWeight: FontWeight.normal
//                     ),),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }).toList(),
//       ],
//     );
//   }
// }

class InsuranceMobileLandscape extends BaseModelWidget<InsuranceViewModel> {
  @override
  Widget build(BuildContext context, InsuranceViewModel model) {

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
