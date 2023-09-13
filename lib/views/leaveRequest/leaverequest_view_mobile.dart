/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape


import 'package:ClockSpotter/entities/vacation_entity/vacation_type_response_entity.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/leaverequest_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/request_letter_viewmodel.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/LetterWidget/LetterTile.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class LeaveRequestMobilePortrait extends BaseModelWidget<LeaveRequestViewModel> {


  @override
  Widget build(BuildContext context, LeaveRequestViewModel model) {


    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;


    var theme = Theme
        .of(context)
        .textTheme;

    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;

    double fontSize=13  ;

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
                    color: AppColor.backgroundColor,
                      // image: DecorationImage(
                      //     fit: BoxFit.cover,
                      //     alignment: Alignment.center,
                      //     image: AssetImage('assets/images/background/back.jpg')
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
                          // image: DecorationImage(
                          //
                          //
                          //     image: AssetImage(
                          //         'assets/images/background/back.jpg'),
                          //     fit: BoxFit.cover,
                          //     alignment: Alignment.topRight
                          // ),
                        ),
                      ),
                      title: Text('Leaves',
                        style: theme.titleLarge?.copyWith(
                          fontSize: 22,
                            color: Colors.white),),
                    ),




                   Expanded(
                     flex: 3,
                     child: SingleChildScrollView(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(
                             horizontal: 20, vertical: 0),
                         child: Form(
                           key: model.formKey,
                           child: Column(
                             children: [
                               Container(

                                 width: double.infinity,
                                 decoration: BoxDecoration(
                                     boxShadow: [
                                       BoxShadow(
                                         color: Colors.black.withOpacity(
                                             0.5), // shadow color
                                         spreadRadius:
                                         2, // how spread out the shadow is
                                         blurRadius:
                                         3, // how blurry the shadow is
                                         offset: Offset(
                                             0, 1), // offset of the shadow
                                       ),
                                     ],
                                     borderRadius: BorderRadius.circular(15.0),
                                     color: AppColor.backgroundContainerSmall
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                                   child: Column(
                                     children: [
                                       Text(
                                         'Today :DD/MM/YY',
                                         style: theme.displaySmall?.copyWith(
                                         ),
                                       ),
                                       SizedBox(height: 5,),
                                       Text(
                                         'Total Annual leaves: 15 | Total sick leaves: 15',
                                         style: theme.displaySmall?.copyWith(
                                         ),
                                       ),
                                       SizedBox(height: 5,),

                                       Text(
                                         'Remaining Annual leaves: 4 | Remaining sick leaves: 8',
                                         style: theme.displaySmall?.copyWith(
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(height: 12.0),

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(left: height * 0.01,
                                         bottom: height * 0.01),
                                     child: Text('Request Leave :',
                                       style: theme.displayMedium?.copyWith(
                                         color: AppColor.textColor,
                                         fontWeight: FontWeight.bold,
                                       ),),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(left: height * 0.01,
                                         bottom: height * 0.01),
                                     child: Text('Leave Type',
                                       style: theme.displayMedium?.copyWith(
                                         color: AppColor.textColor,
                                         fontWeight: FontWeight.bold,
                                         fontSize: fontSize,
                                       ),),
                                   ),
                                   FormBuilderDropdown<VacationType>(
                                     name: 'vacationType',
                                     decoration: InputDecoration(
                                       contentPadding: EdgeInsets.symmetric(
                                           vertical: 8.0, horizontal: 20.0),
                                       // Adjust the padding values

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
                                     items: model.vacationTypes == null ? [] : model.vacationTypes!
                                         .map((e) => DropdownMenuItem(value: e, child: Text('${e.vacationTypeName}')))
                                         .toList(),
                                     validator: (VacationType? value) {
                                       if (value == null) {
                                         print('vacation type validation failed'); // Debugging statement
                                         return 'Please select a vacation type';
                                       }
                                       return null;
                                     },
                                     onChanged: (VacationType? value) {
                                       model.selectedVacationType = value;
                                       model.notifyListeners();
                                     },
                                   ),
                                   // TextFormField(
                                   //   controller: _leaveType,
                                   //
                                   // ),
                                 ],
                               ),
                               SizedBox(height: 12.0),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [

                                   Padding(
                                     padding: EdgeInsets.only(left: height * 0.01,
                                         bottom: height * 0.01),
                                     child: Text('Write a reason',
                                       style: theme.displayMedium?.copyWith(
                                         color: AppColor.textColor,
                                         fontWeight: FontWeight.bold,
                                         fontSize: fontSize,

                                       ),),
                                   ),
                                   FormBuilderTextField(
                                     name: 'reason',
                                     maxLines: 3,
                                     decoration: InputDecoration(
                                       contentPadding: EdgeInsets.symmetric(
                                           vertical: 12.0, horizontal: 20.0),
                                       // Adjust the padding values

                                       hintText: "Write a reason for requesting a leave",
                                       hintStyle: theme.displayMedium?.copyWith(
                                         fontWeight: FontWeight.bold,
                                         color: Colors.grey.shade600,

                                       ),
                                       filled: true,
                                       fillColor: AppColor.fieldColor,

                                       border: OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                         borderRadius: BorderRadius.circular(10.0),
                                       ),
                                     ),
                                     onChanged: (value) {
                                       model.reasonController.text = value!;
                                       model.notifyListeners();
                                     },
                                     validator: (value) {
                                       if (value!.isEmpty) {
                                         print('Reason validation failed'); // Debugging statement
                                         return 'Please enter Reason';
                                       }
                                       return null;
                                     },

                                   ),
                                 ],
                               ),
                               SizedBox(height: 12,),
                               Stack(
                                 children: [

                                   TextFormField(
                                     readOnly: true,
                                     decoration: InputDecoration(
                                       contentPadding: EdgeInsets.symmetric(
                                           vertical: 8.0, horizontal: 120),
                                       // Adjust the padding values

                                       hintText: ".pdf/.jpg",
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
                                   GestureDetector(
                                     onTap: (){
                                       model.pickDocument();
                                     },
                                     child: Container(
                                       child:Center(
                                         child: model.document == null
                                             ? Text(
                                           'Choose File',
                                           style: TextStyle(fontSize: 16, color: AppColor.textColorBlack,fontWeight: FontWeight.bold),
                                         )
                                             : Text(
                                           'Modify File',
                                           style: TextStyle(fontSize: 16,color: Colors.white),
                                         ),
                                       ),
                                       height:height*0.064 ,
                                       width: width*0.3,
                                       decoration: BoxDecoration(
                                           boxShadow: [
                                             BoxShadow(
                                               color: Colors.black.withOpacity(
                                                   0.5), // shadow color
                                               spreadRadius:
                                               2, // how spread out the shadow is
                                               blurRadius:
                                               5, // how blurry the shadow is
                                               offset: Offset(
                                                   0, 3), // offset of the shadow
                                             ),
                                           ],
                                           border: Border.all(
                                               color: AppColor.backgroundContainerSmall

                                           ),

                                           borderRadius:
                                           BorderRadius.circular(10),


                                           color: AppColor.backgroundContainerSmall

                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 12,),


                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Expanded(
                                         child: Padding(
                                           padding: EdgeInsets.only(
                                               left: height * 0.01,
                                               bottom: height * 0.01),
                                           child: Text('From',
                                             style: theme.displayMedium?.copyWith(
                                               color: AppColor.textColor,
                                               fontWeight: FontWeight.bold,
                                               fontSize: fontSize,

                                             ),),
                                         ),
                                       ),
                                       Expanded(
                                         child: Padding(
                                           padding: EdgeInsets.only(
                                               left: height * 0.01,
                                               bottom: height * 0.01),
                                           child: Text('To',
                                             style: theme.displayMedium?.copyWith(
                                               color: AppColor.textColor,
                                               fontWeight: FontWeight.bold,
                                               fontSize: fontSize,

                                             ),),
                                         ),
                                       ),
                                     ],
                                   ),


                                   Row(
                                     children: [
                                       Expanded(
                                         child: FormBuilderDateTimePicker(
                                           name: 'startDate',
                                           inputType: InputType.date,
                                           format: DateFormat('dd-MM-yyyy'),
                                           decoration: InputDecoration(
                                             contentPadding: EdgeInsets.symmetric(
                                                 vertical: 8.0, horizontal: 20.0),
                                             // Adjust the padding values

                                             hintText: 'MM/DD/YYYY',
                                             hintStyle: theme.displayMedium?.copyWith(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.grey.shade600
                                             ),
                                             filled: true,
                                             fillColor: AppColor.fieldColor,

                                             border: OutlineInputBorder(
                                               borderSide: BorderSide.none,
                                               borderRadius: BorderRadius.circular(
                                                   10.0),
                                             ),
                                           ),
                                           validator: (value) {
                                             if (value == null) {
                                               print('Start date validation failed'); // Debugging statement
                                               return 'Please enter Start Date';
                                             }
                                             return null;
                                           },

                                           onChanged: (DateTime? value) {
                                             model.startDate = value;
                                             model.notifyListeners();
                                           },

                                         ),
                                       ),

                                       SizedBox(width: 16.0),
                                       Expanded(
                                         child: FormBuilderDateTimePicker(
                                           name: 'endDate',
                                           inputType: InputType.date,
                                           format: DateFormat('dd-MM-yyyy'),
                                           decoration: InputDecoration(
                                             contentPadding: EdgeInsets.symmetric(
                                                 vertical: 8.0, horizontal: 20.0),
                                             // Adjust the padding values

                                             hintText: 'MM/DD/YYYY',
                                             hintStyle: theme.displayMedium?.copyWith(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.grey.shade600
                                             ),
                                             filled: true,
                                             fillColor: AppColor.fieldColor,

                                             border: OutlineInputBorder(
                                               borderSide: BorderSide.none,
                                               borderRadius: BorderRadius.circular(
                                                   10.0),
                                             ),
                                           ),
                                           validator: (value) {
                                             if (value == null) {
                                               print('End date validation failed'); // Debugging statement
                                               return 'Please enter End Date';
                                             }
                                             return null;
                                           },

                                           onChanged: (DateTime? value) {
                                             model.endDate = value;
                                             model.notifyListeners();
                                           },
                                         ),

                                       ),


                                     ],
                                   ),
                                 ],
                               ),

                               SizedBox(height: 15.0),
                               GestureDetector(
                                 onTap: () async {
                                   try {
                                     print('Button pressed');
                                     // if (model.formKey.currentState != null &&
                                     //     model.formKey.currentState!.validate()) {
                                     print('Form validation successful');
                                     model.formKey.currentState!.save();
                                     await model.onClickVacationRequest();
                                     // } else {
                                     //   print('Form validation failed');
                                     // }
                                   } catch (e) {
                                     print('An error occurred: $e');

                                   }
                                 },
                                 child: Container(
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
                                             0, 3), // offset of the shadow
                                       ),
                                     ],),


                                   child: Center(
                                       child: Text('Submit request', style: theme
                                           .displayMedium?.copyWith(
                                           color: AppColor.textColorBlack,
                                           fontWeight: FontWeight.bold
                                       ),)),
                                 ),
                               ),
                               SizedBox(height: 10,)
                             ],
                           ),
                         ),
                       ),
                     ),
                   ),
                    if(!isKeyboard)
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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

                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColor.backgroundContainer
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Column(
                              children: [


                                Column(

                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,bottom: 5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Previous Requests',
                                          style: theme.displayLarge?.copyWith(
                                              fontSize: 23,
                                            fontWeight: FontWeight.bold,

                                          ),
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

              ]),


        ),
      ),
    );
  }

  Widget _buildList(LeaveRequestViewModel model) {
    double fontSize=11;
    double sizeBox=3;
    List dummy = ['this', 'susu', 'sjhdjs', 'djsks'];
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
                              SizedBox(height: sizeBox,),
                              Text(
                                'Leave Type: Sick',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,

                                      fontSize: fontSize)
                              ),
                              SizedBox(height: sizeBox,),

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
                              SizedBox(height: sizeBox,),
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
                              BorderRadius.circular(10),


                              color: AppColor.approvedColor,
                            ),
                          ) : Container(
                            child: Center(
                                child: Text(
                                    'Rejected',
                                    style: TextStyle(color: AppColor.textColorWhite,
                                        fontSize: 15)
                                )
                            ),
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:AppColor.rejectedColor

                                ),

                                borderRadius:
                                BorderRadius.circular(10),


                                color: AppColor.rejectedColor
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

}

class LeaveRequestMobileLandscape extends BaseModelWidget<LeaveRequestViewModel> {
  @override
  Widget build(BuildContext context, LeaveRequestViewModel model) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SplashSecondView(key: new Key("test"),)));*/
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
