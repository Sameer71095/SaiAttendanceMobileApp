/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:ClockSpotter/entities/vacation_entity/vacation_type_response_entity.dart';
import 'package:ClockSpotter/viewmodels/leaverequest_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ClockSpotter/widgets/app_drawer/app_drawer.dart';
import 'package:ClockSpotter/widgets/base_model_widget.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class LeaveRequestMobilePortrait extends BaseModelWidget<LeaveRequestViewModel> {


  @override
  Widget build(BuildContext context, LeaveRequestViewModel model) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Vacation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'When?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              FormBuilderDateTimePicker(
                name: 'startDate',
                inputType: InputType.date,
                format: DateFormat('dd-MM-yyyy'),
                decoration: const InputDecoration(
                  labelText: 'Start Date',
                  suffixIcon: Icon(Icons.calendar_today),
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
                }, ),
              const SizedBox(height: 10),
              FormBuilderDateTimePicker(
                name: 'endDate',
                inputType: InputType.date,
                format: DateFormat('dd-MM-yyyy'),
                decoration: const InputDecoration(
                  labelText: 'End Date',
                  suffixIcon: Icon(Icons.calendar_today),
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
              const SizedBox(height: 20),
              const Text(
                'Why?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              FormBuilderDropdown<VacationType>(
                name: 'vacationType',
                decoration: const InputDecoration(
                  labelText: 'Vacation Type',
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

              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'reason',
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                  alignLabelWithHint: true,
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
              const SizedBox(height: 20),
              const Text(
                'Do you have any document to upload?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  model.pickDocument();
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: model.document == null
                        ? Text(
                      'Tap to select a file',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    )
                        : Text(
                      'Modify File',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  ),
                ),
                onPressed: () async {
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
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),

            ],
          ),
        ),
      ),
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
