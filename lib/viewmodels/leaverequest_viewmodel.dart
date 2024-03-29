import 'package:ClockSpotter/api/dio_client.dart';
import 'package:ClockSpotter/entities/vacation_entity/vacation_type_response_entity.dart';
import 'package:ClockSpotter/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../api/secureCacheManager.dart';
import 'package:dio/dio.dart';

class LeaveRequestViewModel extends ChangeNotifier {
  String title = 'default';
  final formKey = GlobalKey<FormState>();

  final reasonController = TextEditingController();
  final locationController = TextEditingController();
  bool isPaid = false;
  DateTime? startDate;
  DateTime? endDate;
  final picker = ImagePicker();
  XFile? document;
  VacationType? selectedVacationType;


  late BuildContext context;
  Future<void> initialise(BuildContext contexts) async {
    context=contexts;
    notifyListeners();
    await getVacationTypes();

    // Read the value associated with the key 'EmployeeId'
    String? storedValue = await storage.read(key: 'EmployeeId');
  }

  List<VacationType>? vacationTypes=[];
  Future<void> getVacationTypes() async {
    var response = await client.getvacationtypes();
    vacationTypes=response.data;
      notifyListeners();
  }

  Future<void> pickDate(BuildContext context, bool isStartDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      if (isStartDate) {
        startDate = pickedDate;
      } else {
        endDate = pickedDate;
      }
      notifyListeners();
    }
  }

  Future<void> pickDocument() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    document = pickedFile;
    notifyListeners();
  }
  Future<void> onClickVacationRequest() async {
    // Call the API and store the data in attendanceList
    if(document == null || selectedVacationType == null) {
      // Handle error when no document is selected or no vacation type is selected
      return;
    }
    var formData = FormData.fromMap({
      "employeeId": constants.loginData.employeeId,
      "startDate": startDate!.toIso8601String(),
      "endDate": endDate!.toIso8601String(),
      "reason": reasonController.text,
      "vacationTypeId": selectedVacationType!.vacationTypeId,
      "document": await MultipartFile.fromFile(document!.path, filename: document!.name),
    });
    var response = await client.requestVacation(formData);
    notifyListeners();
    Navigator.pop(context);
  }
}
