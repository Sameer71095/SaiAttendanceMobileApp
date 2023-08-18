/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/my_profile_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/peoples_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/teamMember.dart';
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

class PeoplesMobilePortrait extends BaseModelWidget<PeoplesViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var theme = Theme.of(context).textTheme;
    double fontSize = 15;

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
                      image: AssetImage('assets/images/background/back.jpg'))),
            ),
            Column(
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Container(),
                  title: Text(
                    'My Team',
                    style: theme.titleLarge?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Team Members',
                      textAlign: TextAlign.center,
                      style: theme.displayLarge
                          ?.copyWith(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          // Search filters
                          TextField(
                            controller: model.nameController,
                            decoration: InputDecoration(labelText: 'Name'),
                          ),
                          TextField(
                            controller: model.branchController,
                            decoration: InputDecoration(labelText: 'Branch'),
                          ),
                          TextField(
                            controller: model.positionController,
                            decoration: InputDecoration(labelText: 'Position'),
                          ),
                          ElevatedButton(
                            onPressed: (){
                              model.filterMembers();
                            },
                            child: Text('Apply Filters'),
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: ListView.builder(
                              itemCount: model.filteredMemberList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                Member member = model.filteredMemberList[index];

                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:13),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        elevation: 50,
                                        shadowColor: Colors.black,
                                        color: AppColor.ContainerBackground,
                                        child: SizedBox(
                                          width: double.infinity,
                                          height:model.showDetails==true? height*0.62:height*0.36,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 55,
                                                  child: const CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                      'assets/images/home/place.png',
                                                    ),
                                                    radius: 55,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Rakesh Kumar',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: AppColor.primaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),

                                                SizedBox(
                                                  width: 110,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      model.showDetail();
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                              AppColor.primaryColor),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4),
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.touch_app),
                                                          Text('Details'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10,),
                                                if(model.showDetails)
                                                    Container(
                                                      height:height*0.26,
                                                      width:double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: AppColor.containercolor,
                                                        borderRadius: BorderRadius.circular(20)

                                                      ),

                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Name: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:fontSize ,
                                                                color: Colors.black
                                                            ),
                                                            children:  <TextSpan>[
                                                              TextSpan(text: model.filteredMemberList[index].name, style: TextStyle(fontWeight: FontWeight.normal)
                                                              ),

                                                            ],
                                                          ),
                                                        ),


                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Position: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:fontSize ,
                                                                color: Colors.black
                                                            ),
                                                            children:  <TextSpan>[
                                                              TextSpan(text: model.filteredMemberList[index].position, style: TextStyle(fontWeight: FontWeight.normal)
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Contact Number: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:fontSize-1 ,
                                                                color: Colors.black
                                                            ),
                                                            children:  <TextSpan>[
                                                              TextSpan(text: '03XX-XXXXXXX', style: TextStyle(fontWeight: FontWeight.normal)
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Branch: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:fontSize ,
                                                                color: Colors.black
                                                            ),
                                                            children:  <TextSpan>[
                                                              TextSpan(text: model.filteredMemberList[index].branch, style: TextStyle(fontWeight: FontWeight.normal)
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 10),
                                                        RichText(
                                                          text: TextSpan(
                                                            text: 'Email: ',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:fontSize ,
                                                                color: Colors.black
                                                            ),
                                                            children:  <TextSpan>[
                                                              TextSpan(text: 'rakesh@gmail.com', style: TextStyle(fontWeight: FontWeight.normal)
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

                // Expanded(
                //   child: Container(
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 12),
                //       child: GridView.builder(
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 1,
                //             childAspectRatio: MediaQuery.of(context).size.width /
                //                 (MediaQuery.of(context).size.height / 1),
                //             mainAxisSpacing: height*0.001,
                //             crossAxisSpacing: 5.0,
                //           ),
                //           itemCount: 15,
                //           itemBuilder: (BuildContext ctx, index) {
                //             return Column(
                //               children: [
                //                 Card(
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(20.0),
                //                   ),
                //
                //                   elevation: 50,
                //                   shadowColor: Colors.black,
                //                   color: AppColor.ContainerBackground,
                //                   child: SizedBox(
                //
                //                     width: 300,
                //                     height: 300,
                //                     child: Padding(
                //                       padding: const EdgeInsets.all(20.0),
                //                       child: Column(
                //                         children: [
                //                           CircleAvatar(
                //                             radius: 40,
                //                             child: const CircleAvatar(
                //                               backgroundImage:AssetImage(
                //                                   'assets/images/home/place.png',
                //
                //                                            ),
                //                               radius: 40,
                //                             ), //CircleAvatar
                //                           ), //CircleAvatar
                //                           const SizedBox(
                //                             height: 10,
                //                           ), //SizedBox
                //                           Text(
                //                             'Rakesh kumar',
                //                             style: TextStyle(
                //                               fontSize: 20,
                //                               color: AppColor.primaryColor,
                //                               fontWeight: FontWeight.w500,
                //                             ), //Textstyle
                //                           ), //Text
                //                           const SizedBox(
                //                             height: 10,
                //                           ), //SizedBox
                //                            Text(
                //                             'Rakesh is flutter developer working in rushtech360.He is student of Ned University currently enrolled in 7th semester ',
                //                             style:theme.displayMedium?.copyWith(
                //                               fontSize: 15
                //                             ) //Textstyle
                //                           ), //Text
                //                           const SizedBox(
                //                             height: 10,
                //                           ), //SizedBox
                //                           SizedBox(
                //                             width: 110,
                //
                //                             child: ElevatedButton(
                //                               onPressed: () => 'Null',
                //                               style: ButtonStyle(
                //                                   backgroundColor:
                //                                   MaterialStateProperty.all(Colors.blueAccent)),
                //                               child: Padding(
                //                                 padding: const EdgeInsets.all(4),
                //                                 child: Row(
                //                                   children:  [
                //                                     Icon(Icons.touch_app),
                //                                     Text('Details')
                //                                   ],
                //                                 ),
                //                               ),
                //                             ),
                //
                //                           ) //SizedBox
                //                         ],
                //                       ), //Column
                //                     ), //Padding
                //                   ), //SizedBox
                //                 ),
                //
                //               ],
                //             );
                //             // return Column(
                //             //   mainAxisAlignment: MainAxisAlignment.center,
                //             //   children: [
                //             //     GestureDetector(
                //             //       onTap: (){
                //             //       },
                //             //       child: Padding(
                //             //         padding: const EdgeInsets.all(8.0),
                //             //         child: Container(
                //             //           height: height*0.11,
                //             //           width:width*0.6 ,
                //             //
                //             //           decoration: BoxDecoration(
                //             //               color: Colors.white,
                //             //               border: Border.all(color: Colors.black),
                //             //               borderRadius: BorderRadius.all(
                //             //                 Radius.circular(15.0),
                //             //               ),
                //             //               ),
                //             //           child: Center(
                //             //             child: Image.asset(
                //             //               'assets/images/home/place.png',
                //             //               height:height*0.07,
                //             //             ),
                //             //           ),
                //             //         ),
                //             //       ),
                //             //     ),
                //             //     SizedBox(height: height*0.01,),
                //             //     Column(
                //             //       mainAxisAlignment: MainAxisAlignment.start,
                //             //       crossAxisAlignment: CrossAxisAlignment.start,
                //             //       children: [
                //             //         Text(
                //             //           'Member Name',
                //             //           textAlign: TextAlign.center,
                //             //           style: theme.displaySmall?.copyWith(
                //             //               color: Colors.white
                //             //           ),
                //             //         ),
                //             //         SizedBox(height: height*0.01,),
                //             //         Text(
                //             //           'Member Position',
                //             //           textAlign: TextAlign.center,
                //             //           style: theme.displaySmall?.copyWith(
                //             //               color: Colors.white
                //             //           ),
                //             //         ),
                //             //         SizedBox(height: height*0.01,),
                //             //         Text(
                //             //           'Member Contact',
                //             //           textAlign: TextAlign.center,
                //             //           style: theme.displaySmall?.copyWith(
                //             //             color: Colors.white
                //             //           ),
                //             //         ),
                //             //         SizedBox(height: height*0.01,),
                //             //         Text(
                //             //           'Member Branch',
                //             //           textAlign: TextAlign.center,
                //             //           style: theme.displaySmall?.copyWith(
                //             //               color: Colors.white
                //             //           ),
                //             //         ),
                //             //         SizedBox(height: height*0.01,),
                //             //         Text(
                //             //           'Member Email',
                //             //           textAlign: TextAlign.center,
                //             //           style: theme.displaySmall?.copyWith(
                //             //               color: Colors.white
                //             //           ),
                //             //         ),
                //             //
                //             //
                //             //       ],
                //             //     ),
                //             //
                //             //   ],
                //             // );
                //           }),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PeoplesLandscape extends BaseModelWidget<PeoplesViewModel> {
  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
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
