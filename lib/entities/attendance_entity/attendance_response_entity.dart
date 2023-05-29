class AttendanceResponseEntity {
  bool? isSuccess;
  String? errorMessage;
  List<Data>? data;

  AttendanceResponseEntity({this.isSuccess, this.errorMessage, this.data});

  AttendanceResponseEntity.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Data {
  int? employeeID;
  String? name;
  String? email;
  int? isCheckedOut;

  Data({this.employeeID, this.name, this.email, this.isCheckedOut});

  Data.fromJson(Map<String, dynamic> json) {
    employeeID = json['EmployeeID'];
    name = json['Name'];
    email = json['Email'];
    isCheckedOut = json['IsCheckedOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmployeeID'] = this.employeeID;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['IsCheckedOut'] = this.isCheckedOut;
    return data;
  }
}