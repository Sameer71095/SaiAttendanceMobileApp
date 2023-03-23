

import 'dart:io';

class AttendanceRequestEntity {
  int? employeeId;
  double? latitude;
  double? longitude;
  String? location;
  String? checkedImage;
  File? image;

  AttendanceRequestEntity(
      {this.employeeId,
        this.latitude,
        this.longitude,
        this.location,
        this.checkedImage,
        this.image});

  AttendanceRequestEntity.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    checkedImage = json['checked_image'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['location'] = this.location;
    data['checked_image'] = this.checkedImage;
    data['image'] = this.image;
    return data;
  }
}