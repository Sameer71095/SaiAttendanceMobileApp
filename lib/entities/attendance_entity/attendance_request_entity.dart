

import 'dart:io';

class AttendanceRequestEntity {
  DateTime? checkedTime;
  DateTime? checkedDate;
  double? latitude;
  double? longitude;
  String? location;
  String? checkedImage;
  bool? isCheckedOut;
  bool? isLate;
  String? reason;
  bool? isExcused;
  String? deviceName;
  String? deviceId;
  int? loggedEmployeeId;
  int? employerId;


  AttendanceRequestEntity({
    this.checkedTime,
    this.checkedDate,
    this.latitude,
    this.longitude,
    this.location,
    this.checkedImage,
    this.isCheckedOut,
    this.isLate,
    this.reason,
    this.isExcused,
    this.deviceName,
    this.deviceId,
    this.loggedEmployeeId,
    this.employerId,
  });

  AttendanceRequestEntity.fromJson(Map<String, dynamic> json) {
    checkedTime = DateTime.tryParse(json['checked_time'] ?? '');
    checkedDate = DateTime.tryParse(json['checked_date'] ?? '');
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    isCheckedOut = json['is_checkedout'];
    isLate = json['is_late'];
    reason = json['reason'];
    isExcused = json['is_excused'];
    deviceName = json['device_name'];
    deviceId = json['device_id'];
    loggedEmployeeId = json['logged_employee_id'];
    employerId = json['employer_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checked_time'] = this.checkedTime?.toIso8601String();
    data['checked_date'] = this.checkedDate?.toIso8601String();
    data['location'] = this.location;
    data['is_checkedout'] = this.isCheckedOut;
    data['is_late'] = this.isLate;
    data['reason'] = this.reason;
    data['is_excused'] = this.isExcused;
    data['device_name'] = this.deviceName;
    data['device_id'] = this.deviceId;
    data['logged_employee_id'] = this.loggedEmployeeId;
    data['employer_id'] = this.employerId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;

    return data;
  }
}