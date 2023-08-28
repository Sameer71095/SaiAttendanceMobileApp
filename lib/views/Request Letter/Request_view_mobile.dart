/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/request_letter_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
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

    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;


    return  SafeArea(
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
                          height: height * 0.05,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundContainerSmall,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // shadow color
                                spreadRadius:
                                2, // how spread out the shadow is
                                blurRadius:
                                5, // how blurry the shadow is
                                offset: Offset(
                                    0, 2), // offset of the shadow
                              ),
                            ],),


                          child: Center(
                              child: Text('Submit request', style: theme
                                  .displayMedium?.copyWith(
                                  color: AppColor.textColorBlack,
                                  fontWeight: FontWeight.bold
                              ),)),
                        ),
                      ],
                    ),
                  ),
                ),
                if(!isKeyboard)
                  Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColor.backgroundContainer
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
    double fontSize=12;

    List dummy = ['this', 'susu', 'sjhdjs', 'djsks'];

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          //  model.loadMore(); // Function to load more data when the list reaches the end
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: model.onRefresh,
        color:  AppColor.backgroundColor,
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
                itemCount: dummy.length,

                itemBuilder: (context, index) {

                  return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                        child: Container(

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
                                      0, 3), // offset of the shadow
                                ),
                              ],
                              color: AppColor.backgroundContainerSmall,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'DD/MM/YY',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,


                                                fontSize: fontSize)
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                            'Leave Type: Sick',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,

                                                fontSize: fontSize)
                                        ),
                                        SizedBox(height: 5,),

                                        Text(
                                            'From: DD/MM/YY',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,

                                                fontSize: fontSize)
                                        ),
                                        SizedBox(height: 5,),

                                        Text(
                                            'To: DD/MM/YY',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,

                                                fontSize: fontSize)
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                            'Reason : Because i was ill',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,

                                                fontSize: fontSize)
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {},
                                    child: index == 0 ? Container(
                                      child: Center(
                                          child: Text(
                                              'Approved',
                                              style: TextStyle(color: Colors.white,
                                                  fontSize: 14)
                                          )
                                      ),
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.approvedColor,
                                        ),

                                        borderRadius:
                                        BorderRadius.circular(6),


                                        color: AppColor.approvedColor,
                                      ),
                                    ) : Container(
                                      child: Center(
                                          child: Text(
                                              'Peding',
                                              style: TextStyle(color: AppColor.textColorWhite,
                                                  fontSize: 15)
                                          )
                                      ),
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:AppColor.pendingColor

                                          ),

                                          borderRadius:
                                          BorderRadius.circular(6),


                                          color: AppColor.pendingColor
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
