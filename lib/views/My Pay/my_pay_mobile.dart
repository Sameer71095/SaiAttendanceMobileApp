/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/my_pay_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
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


    return Builder(
      builder: (BuildContext context) {


        return SafeArea(
          child: WillPopScope(
            onWillPop: ()async{
              model.willPopScopeNavigation();
              return true;

            },
            child: Scaffold(


              drawer: DrawerView(),
              body: Stack(
                children: [

                  Container(
                  decoration: BoxDecoration(
                    color: AppColor.backgroundColor
                      // image: DecorationImage(
                      //     fit: BoxFit.cover,
                      //     alignment: Alignment.center,
                      //     image:AssetImage('assets/images/background/back.jpg')
                      // )
                  ),),

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
                                color: AppColor.backgroundContainer
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                              child: Column(
                                children: [

                                  ///

                                  Column(

                                    children: [
                                      Container(
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
                                                        'Name :Sameer Masood',overflow:TextOverflow.ellipsis, style: theme.displayMedium,
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


                                                      color: AppColor.pendingColor,
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
            ),
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

    return ListView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: 5,

    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {},
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
            child: MyPayTile(name: 'Rakesh', date: '23/23/23',

            )
        ),

      );
    },
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
