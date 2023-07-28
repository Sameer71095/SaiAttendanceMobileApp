/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape


import 'package:ClockSpotter/entities/vacation_entity/vacation_type_response_entity.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/leaverequest_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/request_letter_viewmodel.dart';
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
    TextEditingController _leaveType = TextEditingController();
    TextEditingController _reason = TextEditingController();
    TextEditingController _from = TextEditingController();
    TextEditingController _to = TextEditingController();

    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;


    var theme = Theme
        .of(context)
        .textTheme;

    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;

    double fontSize=13  ;

    return Scaffold(

      drawer: NewDrawer(),
      body: Stack(
          children: [

            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      image: AssetImage('assets/images/background/back.jpg')
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


                          image: AssetImage(
                              'assets/images/background/back.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight
                      ),
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
                                 borderRadius: BorderRadius.circular(15.0),
                                 color: AppColor.ContainerBackground
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
                               // TextFormField(
                               //   maxLines: 3,
                               //   controller: _reason,
                               //
                               // ),
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
                                       style: TextStyle(fontSize: 16, color: Colors.white),
                                     )
                                         : Text(
                                       'Modify File',
                                       style: TextStyle(fontSize: 16,color: Colors.white),
                                     ),
                                   ),
                                   height:height*0.067 ,
                                   width: width*0.3,
                                   decoration: BoxDecoration(
                                       border: Border.all(
                                           color: Colors.blue.shade900

                                       ),

                                       borderRadius:
                                       BorderRadius.circular(10),


                                       color: Colors.blue.shade900

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


                               child: Center(
                                   child: Text('Submit request', style: theme
                                       .displayMedium?.copyWith(
                                       color: AppColor.textColor,
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
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColor.ContainerBackground
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          children: [


                            Column(

                              children: [

                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Previous Requests',
                                    style: theme.displayLarge?.copyWith(
                                        fontSize: 23,
                                      fontWeight: FontWeight.bold,

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


      // body:SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Form(
      //     key: model.formKey,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //
      //         const SizedBox(height: 20),
      //         const Text(
      //           'Why?',
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //
      //
      //         const SizedBox(height: 20),
      //
      //         const SizedBox(height: 20),
      //         const Text(
      //           'Do you have any document to upload?',
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //         GestureDetector(
      //           onTap: () async {
      //
      //           },
      //           child: Container(
      //             height: 100,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: Colors.grey),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child:
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10.0),
      //               ),
      //             ),
      //             padding: MaterialStateProperty.all<EdgeInsets>(
      //               const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      //             ),
      //           ),
      //
      //           child: const Text(
      //             'Submit',
      //             style: TextStyle(fontSize: 18, color: Colors.white),
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildList(LeaveRequestViewModel model) {
    double fontSize=12;
    List dummy = ['this', 'susu', 'sjhdjs', 'djsks'];
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: dummy.length,

      itemBuilder: (context, index) {

        return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(

                decoration: BoxDecoration(
                    color: AppColor.containercolor,
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
                                    'Approved!',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 14)
                                )
                            ),
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green
                              ),

                              borderRadius:
                              BorderRadius.circular(10),


                              color: Colors.green.shade500,
                            ),
                          ) : Container(
                            child: Center(
                                child: Text(
                                    'Rejected!',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 14)
                                )
                            ),
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.red

                                ),

                                borderRadius:
                                BorderRadius.circular(10),


                                color: Colors.red
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
