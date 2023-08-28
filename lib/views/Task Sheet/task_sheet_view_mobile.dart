/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape


import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/entities/task_entity/TaskType.dart';
import 'package:ClockSpotter/utils/app_color.dart';
import 'package:ClockSpotter/viewmodels/Attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/attendance_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/request_letter_viewmodel.dart';
import 'package:ClockSpotter/viewmodels/task_sheet_viewmodel.dart';
import 'package:ClockSpotter/views/Attendace/Attendance_view.dart';
import 'package:ClockSpotter/widgets/Drawer/drawer_view.dart';
import 'package:ClockSpotter/widgets/Drawer/new_drawer.dart';
import 'package:ClockSpotter/widgets/TaskWidget/TaskTile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:ClockSpotter/widgets/AttendanceWidget/AttendanceTile.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:ClockSpotter/widgets/base_model_widget.dart';

import '../../utils/Home_Clipper.dart';
import '../../widgets/app_drawer/Drawer_Screen.dart';

class TaskSheetMobilePortrait extends BaseModelWidget<TaskSheetViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, TaskSheetViewModel model) {
    final isKeyboard=MediaQuery.of(context).viewInsets.bottom!=0;



    var theme = Theme.of(context).textTheme;
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    double borderRadius= 10;
    double sizeBox=height*0.02;


    Future<void> _selectDate(BuildContext context, model) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: model.selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

      if (picked != null && picked != model.selectedDate) {
        model.setSelectedDate(picked);
      }
    }

    Future<void> _selectTimeStart(BuildContext context, model) async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: model.selectedTimeStart ?? TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != model.selectedTimeStart) {
        model.setSelectedTimeStart(pickedTime);

      }
    }

    Future<void> _selectTimeEnd(BuildContext context, model) async {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: model.selectedTimeEnd ?? TimeOfDay.now(),
      );

      if (pickedTime != null && pickedTime != model.selectedTimeEnd) {
        model.setSelectedTimeEnd(pickedTime);

      }
    }
    String _formatTime(TimeOfDay time) {
      String period = time.hour >= 12 ? 'PM' : 'AM';
      int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      int minute = time.minute;
      return '$hour:${minute.toString().padLeft(2, '0')} $period';
    }
      String timeStart =model.selectedTimeStart != null
          ? _formatTime(model.selectedTimeStart!)
          : 'Task Start time';
    String timeEnd =model.selectedTimeEnd != null
        ? _formatTime(model.selectedTimeEnd!)
        : 'Task end time';

    // DateTime taskTimeStart = DateFormat("hh:mm:ss").parse(model.formattedTimeStart);
    // DateTime taskTimeEnd = DateFormat("hh:mm:ss").parse(model.formattedTimeEnd);
    //
    // String taskFormattedTimeStart = DateFormat("h:mm a").format(taskTimeStart);
    // String taskFformattedTimeEnd = DateFormat("h:mm a").format(taskTimeEnd);

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
                  title: Text('Task Sheet', style: theme.titleLarge?.copyWith(color: Colors.white),),
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22,),
                    child: Form(
                      key: model.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            maxLines: 4,
                            controller:model.taskDetails,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Adjust the padding values
                              hintText: 'Task details',
                              hintStyle: theme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600
                              ),
                              filled: true,
                              fillColor: AppColor.fieldColor,

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(borderRadius),
                              ),
                            ),
                          ),
                          SizedBox(height: sizeBox+5),
                          Row(
                            children: [
                              Expanded(
                                child: FormBuilderDropdown<TaskType>(
                                  name: 'TaskType',
                                  decoration: InputDecoration(

                                    contentPadding: EdgeInsets.symmetric(vertical:8.0, horizontal: 10.0), // Adjust the padding values
                                    hintText: 'Task Types',
                                    hintStyle: theme.displayMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600
                                    ),
                                    filled: true,
                                    fillColor: AppColor.fieldColor,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(borderRadius),
                                    ),
                                  ),
                                  items: model.TaskTypes == null ? [] : model.TaskTypes!
                                      .map((e) => DropdownMenuItem(value: e, child: Text('${e.TaskTypeName}')))
                                      .toList(),
                                  validator: (TaskType? value) {
                                    if (value == null) {
                                      print('Task type validation failed'); // Debugging statement
                                      return 'Please select a Task type';
                                    }
                                    return null;
                                  },
                                  onChanged: (TaskType? value) {
                                    model.selectedTaskType = value;
                                    model.notifyListeners();
                                  },
                                ),
                              ),
                              SizedBox(width: sizeBox,),

                              Expanded(
                                child: TextFormField(
                                  controller: TextEditingController(
                                    text: model.formattedDate,

                                  ),
                                  style:theme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600
                                  ),

                                  readOnly: true,

                                  onTap: () => _selectDate(context, model),

                                  decoration: InputDecoration(

                                    contentPadding: EdgeInsets.symmetric(vertical:8.0, horizontal: 10.0), // Adjust the padding values
                                    hintText: 'Date:dd/mm/yyyy',
                                    hintStyle: theme.displayMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600
                                    ),
                                    filled: true,
                                    fillColor: AppColor.fieldColor,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(borderRadius),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),



                          SizedBox(height: sizeBox),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () => _selectTimeStart(context, model),
                                  
                                  controller: model.startTimeController..text = timeStart,
                                  // controller: model.startTimeController..text = model.formattedTimeStart,
                                  style:theme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                                    hintText: 'Task Start time',
                                    hintStyle: theme.displayMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600
                                    ),
                                    filled: true,
                                    fillColor: AppColor.fieldColor,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(borderRadius),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: sizeBox,),
                              Expanded(
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () => _selectTimeEnd(context, model),
                                  controller: model.endTimeController..text =timeEnd,
                                  // controller: model.endTimeController..text = model.formattedTimeEnd,
                                  style:theme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0), // Adjust the padding values
                                    hintText: 'Task end time',
                                    hintStyle: theme.displayMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600
                                    ),
                                    filled: true,
                                    fillColor: AppColor.fieldColor,

                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(borderRadius),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height: sizeBox),

                          SizedBox(height: sizeBox),

                          InkWell(
                            onTap: () => model.saveTaskDetails(),
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.5,
                              decoration: BoxDecoration(
                                  color: AppColor.backgroundContainerSmall,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
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
                                        0, 1), // offset of the shadow
                                  ),
                                ],),
                              child: Center(child: Text('Add new Task',style: theme.displayMedium?.copyWith(
                                  color: AppColor.addNewTask,
                                  fontWeight: FontWeight.bold
                              ),),),
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                ),
                if(!isKeyboard)
                  Expanded(
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
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Task History',
                                        style:theme.displayLarge?.copyWith(
                                            fontSize: 28
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



          ], ),),
    );
  }



  Widget _buildList(TaskSheetViewModel model)  {

    double fontSize=12;

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
                itemCount: model.employeeTasks?.length,

                itemBuilder: (context, index) {
                  final employeeTasks = model.employeeTasks;
                  DateTime dateTime = DateTime.parse(employeeTasks![index].taskDate.toString());
                  DateTime apiTimeStart = DateFormat("HH:mm:ss").parse(employeeTasks[index].taskStartTime.toString());
                  DateTime apiTimeEnd = DateFormat("HH:mm:ss").parse(employeeTasks[index].taskEndTime.toString());

                  String formattedTimeStart = DateFormat("h:mm a").format(apiTimeStart);
                  String formattedTimeEnd = DateFormat("h:mm a").format(apiTimeEnd);

                  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 5,right: 5,top: 5),
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
                          color:AppColor.backgroundContainerSmall,
                          borderRadius:  BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Text(formattedDate,style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSize,
                                        ),),

                                        SizedBox(height: 8,),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Task Description: ',
                                            style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                            fontSize: fontSize,
                                              color: Colors.black
                                          ),
                                            children:  <TextSpan>[
                                              TextSpan(text: employeeTasks[index].taskDescription.toString()??'no task descripiontion', style: TextStyle(fontWeight: FontWeight.normal)
                                                ),

                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 10,),
                                        Text(
                                         'Task Type: '+ employeeTasks[index].name.toString()??'no task name ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: fontSize,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                InkWell(
                                  onTap: (){
                                    // Handle marking task as done
                                  },
                                  child: Container(
                                    child: Center(
                                      child: employeeTasks[index].isTaskCompleted.toString()==true
                                          ? Text(
                                        'Mark as Done!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontSize,
                                        ),
                                      )
                                          : Icon(Icons.check,color: Colors.white,),
                                    ),
                                    height: 35,
                                    width:   employeeTasks[index].isTaskCompleted.toString()==true? 100 : 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.green,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment:Alignment.topLeft,
                              child: Text(
                               'Start Time: ' + formattedTimeStart+"  |  "+' End Time: ' +formattedTimeEnd,

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize,
                                ),
                              ),
                            ),
                          ],
                        ),

                        )
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
class TaskSheetMobileLandscape extends BaseModelWidget<TaskSheetViewModel> {
  @override
  Widget build(BuildContext context, TaskSheetViewModel model) {
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
