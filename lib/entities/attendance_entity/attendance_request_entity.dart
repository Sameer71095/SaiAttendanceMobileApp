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
    checkedTime = json.containsKey('checkedTime') ? DateTime.tryParse(json['checkedTime']) : null;
    checkedDate = json.containsKey('checkedDate') ? DateTime.tryParse(json['checkedDate']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    checkedImage = json['checkedImage'];
    isCheckedOut = json['isCheckedOut'];
    isLate = json['isLate'];
    reason = json['reason'];
    isExcused = json['isExcused'];
    deviceName = json['deviceName'];
    deviceId = json['deviceId'];
    loggedEmployeeId = json['loggedEmployeeId'];
    employerId = json['employerId'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkedTime'] = this.checkedTime?.toIso8601String();
    data['checkedDate'] = this.checkedDate?.toIso8601String();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['checkedImage'] = this.checkedImage;
    data['isCheckedOut'] = this.isCheckedOut;
    data['isLate'] = this.isLate;
    data['reason'] = this.reason;
    data['isExcused'] = this.isExcused;
    data['deviceName'] = this.deviceName;
    data['deviceId'] = this.deviceId;
    data['loggedEmployeeId'] = this.loggedEmployeeId;
    data['employerId'] = this.employerId;
    return data;
  }
}
