/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/my_pay_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/My%20Pay%20Widget/MyPay.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/widgets/AttendanceWidget/AttendanceTile.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class MyPayMobilePortrait extends BaseModelWidget<MyPayViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, MyPayViewModel model) {
    var theme = Theme.of(context).textTheme;

    List myProductonTap = [];

    return Builder(
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
                    title: Text('My Pay',style: theme.titleLarge?.copyWith(color: Colors.white),),
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
                                                  Container(
                                                    constraints:  BoxConstraints(maxWidth: 150),
                                                    child: Text(
                                                      'Name :Ramish Masood',overflow:TextOverflow.ellipsis, style: theme.displayMedium,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Container(
                                                    constraints:  BoxConstraints(maxWidth: 150),
                                                    child: Text(
                                                      "salary : 50,000",overflow:TextOverflow.ellipsis,style: theme.displayMedium,
                                                    ),
                                                  ),

                                                ],

                                              ),

                                              InkWell(
                                                onTap: (){
                                                },
                                                child: Container(
                                                  child: Center(
                                                    child: Text(
                                                        'Pending',
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
    );
  }

  Widget _customAppBar(MyPayViewModel model) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Hello\n",
              style: const TextStyle(
                  color: Colors.black, fontFamily: "Sofia", fontSize: 18.0),

              children: [

                TextSpan(
                  text: constants.loginData.name,
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

        ],
      ),
    );
  }
  Widget _buildList(MyPayViewModel model) {
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
                          child: MyPayTile(
                            name: attendance.employeeName!,
                            date: attendance.checkedDate!,
                            totalHours: attendance.totalHours!, // Update this value based on your data calculation
                            timeEntries: attendance.checked
                            !.map((e) => {
                              e.isCheckedout: e.checkedTime!,
                              /*   'out': e.isCheckedout ? 'checked out' : null,*/
                            })
                                .toList(),

                          )
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


class AttendanceMobileLandscape extends BaseModelWidget< MyPayViewModel> {
  @override
  Widget build(BuildContext context, MyPayViewModel model) {
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
