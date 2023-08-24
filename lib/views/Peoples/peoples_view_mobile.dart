/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape


import 'package:ClockSpotter/entities/task_entity/get_all_team_response.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/peoples_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';

import 'package:flutter/material.dart';

import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';


class PeoplesMobilePortrait extends BaseModelWidget<PeoplesViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, PeoplesViewModel model) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context).textTheme;
    // List<String> item1 = ['Rakesh ', 'Sameer', 'Ramish'];
    // List<String> item2 = ['Interm', 'Senior', 'Junior'];
    // List<String> item3 = ['City ', 'Village', 'Head'];
    // List<String> item4 = ['Developer ', 'Project', 'Human Resources'];


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
                                    child:  model.dropDownFitler('Branch',model.locationNames,Icon(Icons.location_city,color: Colors.grey.shade600),  (selectedBranch) {
                                      model.updateSelectedBranch(selectedBranch);
                                    },),

                                    ),
                              ),
                              SizedBox(
                                width: width * 0.011,
                              ),
                              Expanded(
                                child: Container(
                                    child:   model.dropDownFitler('Department',model.departmentNames,Icon(Icons.business,color: Colors.grey.shade600,),(selectedDepartment) {
                                      model.updateSelectedDepartment(selectedDepartment);
                                    },),

                                    ),
                              )
                            ],
                          ),
                          //Implementation of filter when button is pressed
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

                        ],
                      ),
                    ),
                  ),
                )

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
                            height: model.expandedIndex == index
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
                                        model.toggleDetail(index);
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
                                  if (model.expandedIndex == index)
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
