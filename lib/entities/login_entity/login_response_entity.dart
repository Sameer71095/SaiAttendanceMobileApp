class LoginResponseEntity {
  bool? isSuccess;
  String? message;
  Data? data;

  LoginResponseEntity({this.isSuccess, this.message, this.data});

  LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? employeeId;
  String? name;
  String? email;
  String? token;
  bool? isLocationBound;
  int? locationId;
  bool? isImagesRegistered;
  bool? isFaceRecognitionEnabled;
  double? latitude;
  double? longitude;
  int? radius;
  String? location;
  bool? isCheckedout;
  String? checkedDate;
  String? checkedTime;
  String? shiftStartTime;
  String? shiftEndTime;

  Data(
      {this.employeeId,
        this.name,
        this.email,
        this.token,
        this.isLocationBound,
        this.locationId,
        this.isImagesRegistered,
        this.isFaceRecognitionEnabled,
        this.latitude,
        this.longitude,
        this.radius,
        this.location,
        this.isCheckedout,
        this.checkedDate,
        this.checkedTime,
        this.shiftStartTime,
        this.shiftEndTime});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    isLocationBound = json['isLocationBound'];
    locationId = json['locationId'];
    isImagesRegistered = json['isImagesRegistered'];
    isFaceRecognitionEnabled = json['isFaceRecognitionEnabled'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    radius = json['radius'];
    location = json['location'];
    isCheckedout = json['isCheckedout'];
    checkedDate = json['checkedDate'];
    checkedTime = json['checkedTime'];
    shiftStartTime = json['shiftStartTime'];
    shiftEndTime = json['shiftEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['isLocationBound'] = this.isLocationBound;
    data['locationId'] = this.locationId;
    data['isImagesRegistered'] = this.isImagesRegistered;
    data['isFaceRecognitionEnabled'] = this.isFaceRecognitionEnabled;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['radius'] = this.radius;
    data['location'] = this.location;
    data['isCheckedout'] = this.isCheckedout;
    data['checkedDate'] = this.checkedDate;
    data['checkedTime'] = this.checkedTime;
    data['shiftStartTime'] = this.shiftStartTime;
    data['shiftEndTime'] = this.shiftEndTime;
    return data;
  }
}