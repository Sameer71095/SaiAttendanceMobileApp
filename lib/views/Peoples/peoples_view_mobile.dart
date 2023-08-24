/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/api/secureCacheManager.dart';
import 'package:ClockSpotter/entities/departments/DepartmentsResponseEntity.dart';
import 'package:ClockSpotter/entities/task_entity/get_all_team_response.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/my_profile_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/peoples_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/views/Peoples/peoples_view.dart';
import 'package:ClockSpotter/views/login/login_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/teamMember.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/viewmodels/home_viewmodel.dart';
import 'package:ClockSpotter/widgets/AttendanceWidget/AttendanceTile.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class PeoplesMobilePortrait extends BaseModelWidget<PeoplesViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context).textTheme;
    List<String> item1 = ['Rakesh ', 'Sameer', 'Ramish'];
    List<String> item2 = ['Interm', 'Senior', 'Junior'];
    List<String> item3 = ['City ', 'Village', 'Head'];
    List<String> item4 = ['Developer ', 'Project', 'Human Resources'];

    // customDropDownPrograms(PeoplesViewModel model) {
    //
    //                 ListTile(
    //                 visualDensity: VisualDensity(horizontal: 0, vertical: -3),
    //                 leading: SizedBox(
    //
    //                     height: height*0.095,
    //                     width:width*0.095 ,
    //                 child: Text(item[index],style: theme.titleLarge?.copyWith(
    //                     fontSize: 18
    //                 ))
    //
    //               )),
    //               Divider(thickness: 1,),
    //
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   );}

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
                          Row(
                            children: [
                              // Expanded(
                              //   child: Column(
                              //     children: [
                              //       if (model.isSearchVisible) // Display the TextField conditionally
                              //         FormBuilderTextField(
                              //           name: 'TaskTypeSearch',
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 8.0, horizontal: 10.0),
                              //             hintText: 'Search Task Types',
                              //             hintStyle:
                              //             theme.displayMedium?.copyWith(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.grey.shade600,
                              //             ),
                              //           ),
                              //           onChanged: (String? value) {
                              //             // Implement your logic here to filter the Dropdown items based on the search value
                              //             // You can use setState or any state management approach to update the filtered items
                              //           },
                              //         ),
                              //       FormBuilderDropdown<Department>(
                              //         name: 'TaskType',
                              //         decoration: InputDecoration(
                              //           contentPadding: EdgeInsets.symmetric(
                              //               vertical: 8.0, horizontal: 10.0),
                              //           hintText: 'Task Types',
                              //           hintStyle:
                              //               theme.displayMedium?.copyWith(
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.grey.shade600,
                              //           ),
                              //           filled: true,
                              //           fillColor: AppColor.fieldColor,
                              //           border: OutlineInputBorder(
                              //             borderSide: BorderSide.none,
                              //             borderRadius:
                              //                 BorderRadius.circular(10),
                              //           ),
                              //         ),
                              //         onTap: () {
                              //           model.searchTextField();
                              //
                              //         },
                              //         items: model.Departments == null
                              //             ? []
                              //             : model.Departments!
                              //                 .map((e) => DropdownMenuItem(
                              //                     value: e,
                              //                     child: Text(
                              //                         '${e.departmentName}')))
                              //                 .toList(),
                              //         validator: (Department? value) {
                              //           if (value == null) {
                              //             print('Task type validation failed');
                              //             return 'Please select a Task type';
                              //           }
                              //           return null;
                              //         },
                              //         onChanged: (Department? value) {
                              //           model.selectedDepartment = value;
                              //           model.notifyListeners();
                              //         },
                              //       ),
                              //
                              //     ],
                              //   ),
                              // ),
                              // Expanded(
                              //   child: Container(
                              //     child: model.dropDownFitler(
                              //         'Name',
                              //         model.departmentNames,
                              //
                              //         Icon(Icons.person,
                              //             color: AppColor.iconColorBlack)),
                              //   ),
                              // ),
                              SizedBox(
                                width: width * 0.011,
                              ),
                              // Expanded(
                              //   child: Container(
                              //       child:  model.dropDownFitler('Position',model.departmentNames,Icon(Icons.assignment_ind,color: AppColor.iconColorBlack,)),
                              //
                              //       ),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.014,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    child:  model.dropDownFitler('Branch',model.locationNames,Icon(Icons.location_city,color: AppColor.iconColorBlack),  (selectedBranch) {
                                      model.updateSelectedBranch(selectedBranch);
                                    },),

                                    ),
                              ),
                              SizedBox(
                                width: width * 0.011,
                              ),
                              Expanded(
                                child: Container(
                                    child:   model.dropDownFitler('Department',model.departmentNames,Icon(Icons.business,color: AppColor.iconColorBlack,),(selectedDepartment) {
                                      model.updateSelectedDepartment(selectedDepartment);
                                    },),

                                    ),
                              )
                            ],
                          ),

                          // Search filters
                          // TextField(
                          //   controller: model.nameController,
                          //   decoration: InputDecoration(labelText: 'Name'),
                          // ),
                          // TextField(
                          //   controller: model.branchController,
                          //   decoration: InputDecoration(labelText: 'Branch'),
                          // ),
                          // TextField(
                          //   controller: model.positionController,
                          //   decoration: InputDecoration(labelText: 'Position'),
                          // ),
                          // ElevatedButton(
                          //   onPressed: (){
                          //     model.filterMembers();
                          //   },
                          //   child: Text('Apply Filters'),
                          // ),

                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: _buildList(model, context),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          // Expanded(
                          //   child: ListView.builder(
                          //     itemCount: model.filteredMemberList.length,
                          //     itemBuilder: (BuildContext ctx, index) {
                          //       Member member = model.filteredMemberList[index];
                          //
                          //       return Column(
                          //         children: [
                          //           Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 horizontal: 13),
                          //             child: Card(
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(20.0),
                          //               ),
                          //               elevation: 50,
                          //               shadowColor: Colors.black,
                          //               color: AppColor.ContainerBackground,
                          //               child: SizedBox(
                          //                 width: double.infinity,
                          //                 height: model.showDetails == true
                          //                     ? height * 0.62
                          //                     : height * 0.36,
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.symmetric(
                          //                       horizontal: 20, vertical: 20),
                          //                   child: Column(
                          //                     children: [
                          //                       CircleAvatar(
                          //                         radius: 55,
                          //                         child: const CircleAvatar(
                          //                           backgroundImage: AssetImage(
                          //                             'assets/images/home/place.png',
                          //                           ),
                          //                           radius: 55,
                          //                         ),
                          //                       ),
                          //                       const SizedBox(
                          //                         height: 10,
                          //                       ),
                          //                       Text(
                          //                         'Rakesh Kumar',
                          //                         style: TextStyle(
                          //                           fontSize: 22,
                          //                           color:
                          //                               AppColor.primaryColor,
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                       ),
                          //                       const SizedBox(
                          //                         height: 10,
                          //                       ),
                          //                       SizedBox(
                          //                         width: 110,
                          //                         child: ElevatedButton(
                          //                           onPressed: () {
                          //                             model.showDetail();
                          //                           },
                          //                           style: ButtonStyle(
                          //                             backgroundColor:
                          //                                 MaterialStateProperty
                          //                                     .all(AppColor
                          //                                         .primaryColor),
                          //                           ),
                          //                           child: Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     4),
                          //                             child: Row(
                          //                               children: [
                          //                                 Icon(Icons.touch_app),
                          //                                 Text('Details'),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       SizedBox(
                          //                         height: 10,
                          //                       ),
                          //                       if (model.showDetails)
                          //                         Container(
                          //                           height: height * 0.26,
                          //                           width: double.infinity,
                          //                           decoration: BoxDecoration(
                          //                               color: AppColor
                          //                                   .containercolor,
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(20)),
                          //                           child: Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     20.0),
                          //                             child: Column(
                          //                               crossAxisAlignment:
                          //                                   CrossAxisAlignment
                          //                                       .start,
                          //                               children: [
                          //                                 RichText(
                          //                                   text: TextSpan(
                          //                                     text: 'Name: ',
                          //                                     style: TextStyle(
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                         fontSize:
                          //                                             fontSize,
                          //                                         color: Colors
                          //                                             .black),
                          //                                     children: <TextSpan>[
                          //                                       TextSpan(
                          //                                           text: model
                          //                                               .filteredMemberList[
                          //                                                   index]
                          //                                               .name,
                          //                                           style: TextStyle(
                          //                                               fontWeight:
                          //                                                   FontWeight.normal)),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 SizedBox(height: 10),
                          //                                 RichText(
                          //                                   text: TextSpan(
                          //                                     text:
                          //                                         'Position: ',
                          //                                     style: TextStyle(
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                         fontSize:
                          //                                             fontSize,
                          //                                         color: Colors
                          //                                             .black),
                          //                                     children: <TextSpan>[
                          //                                       TextSpan(
                          //                                           text: model
                          //                                               .filteredMemberList[
                          //                                                   index]
                          //                                               .position,
                          //                                           style: TextStyle(
                          //                                               fontWeight:
                          //                                                   FontWeight.normal)),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 SizedBox(height: 10),
                          //                                 RichText(
                          //                                   text: TextSpan(
                          //                                     text:
                          //                                         'Contact Number: ',
                          //                                     style: TextStyle(
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                         fontSize:
                          //                                             fontSize -
                          //                                                 1,
                          //                                         color: Colors
                          //                                             .black),
                          //                                     children: <TextSpan>[
                          //                                       TextSpan(
                          //                                           text:
                          //                                               '03XX-XXXXXXX',
                          //                                           style: TextStyle(
                          //                                               fontWeight:
                          //                                                   FontWeight.normal)),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 SizedBox(height: 10),
                          //                                 RichText(
                          //                                   text: TextSpan(
                          //                                     text: 'Branch: ',
                          //                                     style: TextStyle(
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                         fontSize:
                          //                                             fontSize,
                          //                                         color: Colors
                          //                                             .black),
                          //                                     children: <TextSpan>[
                          //                                       TextSpan(
                          //                                           text: model
                          //                                               .filteredMemberList[
                          //                                                   index]
                          //                                               .branch,
                          //                                           style: TextStyle(
                          //                                               fontWeight:
                          //                                                   FontWeight.normal)),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                                 SizedBox(height: 10),
                          //                                 RichText(
                          //                                   text: TextSpan(
                          //                                     text: 'Email: ',
                          //                                     style: TextStyle(
                          //                                         fontWeight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                         fontSize:
                          //                                             fontSize,
                          //                                         color: Colors
                          //                                             .black),
                          //                                     children: <TextSpan>[
                          //                                       TextSpan(
                          //                                           text:
                          //                                               'rakesh@gmail.com',
                          //                                           style: TextStyle(
                          //                                               fontWeight:
                          //                                                   FontWeight.normal)),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                             ),
                          //                           ),
                          //                         ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height: 13,
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   ),
                          // ),
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

  Widget _buildList(PeoplesViewModel model, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    double fontSize = 15;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          //  model.loadMore(); // Function to load more data when the list reaches the end
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: model.onRefresh,
        color: Colors.blueAccent,
        child: ValueListenableBuilder<bool>(
          valueListenable: model.dataLoaded,
          builder: (BuildContext context, bool dataLoaded, Widget? child) {
            if (!dataLoaded) {
              model.loadData();
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: model.filteredTeam.length,
                itemBuilder: (BuildContext ctx, index) {
                  Employee team = model.filteredTeam[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 50,
                          shadowColor: Colors.black,
                          color: AppColor.ContainerBackground,
                          child: SizedBox(
                            width: double.infinity,
                            height: model.showDetails == true &&
                                    model.expanded == index
                                ? height * 0.65
                                : height * 0.38,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
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
                                  Expanded(
                                    child: Text(
                                      team.name.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(

                                        fontSize: 20,
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                        model.expanded = index;
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (model.expanded == index &&
                                      model.showDetails)
                                    Container(
                                      height: height * 0.30,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColor.containercolor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                                                    fontSize: fontSize,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          team.name.toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            RichText(
                                              text: TextSpan(
                                                text: 'Contact Number: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize - 1,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: team.phoneNumber
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            RichText(
                                              text: TextSpan(
                                                text: 'Department: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: team.departmentName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            RichText(
                                              text: TextSpan(
                                                text: 'Branch: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: fontSize,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: team.branchName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Expanded(
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Email: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: fontSize,
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text:
                                                            team.email.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight
                                                                .normal)),
                                                  ],
                                                ),
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
              );
            }
          },
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
