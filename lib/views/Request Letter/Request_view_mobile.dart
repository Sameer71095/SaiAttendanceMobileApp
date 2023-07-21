/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/request_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/LetterWidget/LetterTile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';


class RequestLetterMobilePortrait extends BaseModelWidget<RequestLetterViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, RequestLetterViewModel model) {
    TextEditingController _letterNameController = TextEditingController();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();


    var theme = Theme.of(context).textTheme;
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;



    return  SafeArea(
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
                  title: Text('Letter Request',style: theme.titleLarge?.copyWith(color: Colors.white),),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                              child: Text('Letter Type',style: theme.displayMedium?.copyWith(
                                color: AppColor.textColor,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            TextFormField(
                              controller: _letterNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values

                                hintText: "select a type",
                                hintStyle: theme.displayMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600
                                ),
                                filled: true,
                                fillColor: AppColor.fieldColor,

                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                                    child: Text('Starting Date',style: theme.displayMedium?.copyWith(
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: height*0.01,bottom: height*0.01),
                                    child: Text('Ending Date',style: theme.displayMedium?.copyWith(
                                      color: AppColor.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ],
                            ),


                           
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _firstNameController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values

                                      hintText: 'MM/DD/YY',
                                      hintStyle: theme.displayMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600
                                      ),
                                      filled: true,
                                      fillColor: AppColor.fieldColor,

                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),

                                Expanded(
                                  child: TextFormField(
                                    controller: _lastNameController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values

                                      hintText: 'MM/DD/YY',
                                      hintStyle: theme.displayMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade600
                                      ),
                                      filled: true,
                                      fillColor: AppColor.fieldColor,

                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 15.0),
                        Container(
                          height: height*0.05,
                          width: width*0.4,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.lightBlue,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 3.0, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 5  horizontally
                                    0.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ]),


                          child: Center(child: Text('Submit',style: theme.displayMedium?.copyWith(
                              color: AppColor.textColor,
                              fontWeight: FontWeight.bold
                          ),)),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColor.ContainerBackground
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [


                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Requested Letter',
                                        style:theme.displayLarge?.copyWith(
                                            fontSize: 28
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: _buildList(model),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

  ] )),
    );




}

  Widget _buildList(RequestLetterViewModel model) {
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
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Container(

                          decoration: BoxDecoration(
                              color:AppColor.containercolor,
                              borderRadius:  BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: LetterTile(
                              name: attendance.employeeName!,
                              date: attendance.checkedDate!,
                              totalHours: attendance.totalHours!, // Update this value based on your data calculation
                              timeEntries: attendance.checked
                              !.map((e) => {
                                e.isCheckedout: e.checkedTime!,
                                /*   'out': e.isCheckedout ? 'checked out' : null,*/
                              })
                                  .toList(), index: index,
                            ) ,
                          ),
                        ),
                      )

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
class AttendanceMobileLandscape extends BaseModelWidget<RequestLetterViewModel> {
  @override
  Widget build(BuildContext context, RequestLetterViewModel model) {
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
