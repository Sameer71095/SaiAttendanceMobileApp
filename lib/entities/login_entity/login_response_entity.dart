class LoginResponseEntity {
  bool? isSuccess;
  String? errorMessage;
  Data? data;

  LoginResponseEntity({this.isSuccess, this.errorMessage, this.data});

  LoginResponseEntity.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? employeeID;
  int? employerID;
  String? name;
  String? email;
  Null? token;
  String? phoneNumber;
  String? jobTitle;
  int? departmentId;
  Null? profileImage;
  Null? dateOfBirth;
  Null? address;
  Null? gender;
  String? weekendDays;
  String? workdayEndTime;
  bool? isImagesRegistered;
  String? checkedTime;
  String? checkedDate;
  bool? isCheckedout;

  Data(
      {this.employeeID,
        this.employerID,
        this.name,
        this.email,
        this.token,
        this.phoneNumber,
        this.jobTitle,
        this.departmentId,
        this.profileImage,
        this.dateOfBirth,
        this.address,
        this.gender,
        this.weekendDays,
        this.workdayEndTime,
        this.isImagesRegistered,
        this.checkedTime,
        this.checkedDate,
        this.isCheckedout});

  Data.fromJson(Map<String, dynamic> json) {
    employeeID = json['EmployeeID'];
    employerID = json['EmployerID'];
    name = json['Name'];
    email = json['Email'];
    token = json['Token'];
    phoneNumber = json['PhoneNumber'];
    jobTitle = json['JobTitle'];
    departmentId = json['DepartmentId'];
    profileImage = json['ProfileImage'];
    dateOfBirth = json['DateOfBirth'];
    address = json['Address'];
    gender = json['Gender'];
    weekendDays = json['WeekendDays'];
    workdayEndTime = json['WorkdayEndTime'];
    isImagesRegistered = json['IsImagesRegistered'];
    checkedTime = json['CheckedTime'];
    checkedDate = json['CheckedDate'];
    isCheckedout = json['IsCheckedout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeID'] = this.employeeID;
    data['EmployerID'] = this.employerID;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Token'] = this.token;
    data['PhoneNumber'] = this.phoneNumber;
    data['JobTitle'] = this.jobTitle;
    data['DepartmentId'] = this.departmentId;
    data['ProfileImage'] = this.profileImage;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Address'] = this.address;
    data['Gender'] = this.gender;
    data['WeekendDays'] = this.weekendDays;
    data['WorkdayEndTime'] = this.workdayEndTime;
    data['IsImagesRegistered'] = this.isImagesRegistered;
    data['CheckedTime'] = this.checkedTime;
    data['CheckedDate'] = this.checkedDate;
    data['IsCheckedout'] = this.isCheckedout;
    return data;
  }
}