class AttendanceResponseEntity {
  bool? isSuccess;
  String? errorMessage;
  List<Data>? data;

  AttendanceResponseEntity({this.isSuccess, this.errorMessage, this.data});

  AttendanceResponseEntity.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['message'];  // Change here
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
    data['message'] = this.errorMessage;  // Change here
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
    employeeID = json['employeeID'];  // Change here
    name = json['name'];              // Change here
    email = json['email'];            // Change here
    isCheckedOut = json['isCheckedOut']; // Change here
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeID'] = this.employeeID; // Change here
    data['name'] = this.name;             // Change here
    data['email'] = this.email;           // Change here
    data['isCheckedOut'] = this.isCheckedOut; // Change here
    return data;
  }
}
