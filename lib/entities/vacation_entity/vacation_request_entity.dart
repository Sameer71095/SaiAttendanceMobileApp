import 'package:dio/dio.dart';

class VacationRequestEntity {
  int? employeeId;
  DateTime? startDate;
  DateTime? endDate;
  String? reason;
  int? vacationTypeId;
  bool? isPaid;
  String? location;
  MultipartFile? document;

  VacationRequestEntity({
    this.employeeId,
    this.startDate,
    this.endDate,
    this.reason,
    this.vacationTypeId,
    this.isPaid,
    this.location,
    this.document,
  });

  VacationRequestEntity.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    startDate = DateTime.tryParse(json['startDate']);
    endDate = DateTime.tryParse(json['endDate']);
    reason = json['reason'];
    vacationTypeId = json['vacationTypeId'];
    isPaid = json['isPaid'];
    location = json['location'];
    // The 'document' field is a file, and handling it is not straightforward
    // Therefore, it's not included in fromJson and toJson methods
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['startDate'] = this.startDate?.toIso8601String();
    data['endDate'] = this.endDate?.toIso8601String();
    data['reason'] = this.reason;
    data['vacationTypeId'] = this.vacationTypeId;
    data['isPaid'] = this.isPaid;
    data['location'] = this.location;
    // The 'document' field is a file, and handling it is not straightforward
    // Therefore, it's not included in fromJson and toJson methods
    return data;
  }
}
