/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Insurance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/work_expense_viewmodel.dart';

import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:flutter/material.dart';

import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class WorkExpenseMobilePortrait extends BaseModelWidget<WorkExpenseViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context,WorkExpenseViewModel model) {
    var theme = Theme.of(context).textTheme;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List<Map<String, dynamic>> list = [
      {
        'name': 'Muhammad',
        'date from': '12/12/12',
        'time till': '12/12/12',
      },

      // Add more rows here
    ];

    return SafeArea(
      child: Scaffold(
          drawer: NewDrawer(),
          body: Stack(children: [
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
                    'Work Expense',
                    style: theme.titleLarge?.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: height*0.05,),

                // Text('Insurance Certificate',style: theme.displayLarge?.copyWith(
                //   fontSize: 26,
                //     color: AppColor.textColor,
                //     fontWeight: FontWeight.bold
                // ),),
                // SizedBox(height: height*0.04,),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MyTable(),
                ),
                SizedBox(height: height*0.04,),
                //
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
                //           Text('Ramish Masood',style: theme.displayMedium?.copyWith(
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
          ])),
    );
  }
}

class MyTable extends StatelessWidget {

  final List<Map<String, String>> tableData = [
    {
      'name': 'John Doe',
      'dateFrom': '2023-07-01',
      'dateTill': '2023-07-15',
    },

    // Add more data rows here as needed...
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    double vertical = 25;
    double font = 14;


    return Table(
      border: TableBorder.all(color: Colors.white,width: 1),
      columnWidths: {
        0: FlexColumnWidth(2), // Adjust the width of the first column
        1: FlexColumnWidth(3), // Adjust the width of the second column
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: vertical),
                child: Center(
                  child: Text('Activities',style: theme.displaySmall?.copyWith(
                  color: Colors.white,
                      fontSize: font,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: vertical),
                child: Center(
                  child: Text(
                    '-',
                    style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      fontSize: font

                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
        // Generate the table rows dynamically from the data list
        ...tableData.map((data) {
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text('Working Hours' ,style: theme.displaySmall?.copyWith(
          color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text( '-',style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        ...tableData.map((data) {
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text('Time off', style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text( '-',style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        ...tableData.map((data) {
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text('Insurance', style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text( '-',style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        ...tableData.map((data) {
          return TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text('Benfits', style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: vertical),
                  child: Center(
                    child: Text( '-',style: theme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontSize: font,

                        fontWeight: FontWeight.normal
                    ),),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}

class WorkExpenseMobileLandscape extends BaseModelWidget<WorkExpenseViewModel> {
  @override
  Widget build(BuildContext context,WorkExpenseViewModel model) {

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
