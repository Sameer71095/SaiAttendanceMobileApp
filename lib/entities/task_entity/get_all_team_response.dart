class GetAllTeamResponse {
  bool? isSuccess;
  String? message;
  List<Employee>? data;

  GetAllTeamResponse({this.isSuccess, this.message, this.data});

  GetAllTeamResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Employee>[];
      json['data'].forEach((v) {
        data!.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  String? name;
  String? phoneNumber;
  String? email;
  String? departmentName;
  String? branchName;

  Employee({
    this.name,
    this.phoneNumber,
    this.email,
    this.departmentName,
    this.branchName,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    departmentName = json['departmentName'];
    branchName = json['branchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['departmentName'] = this.departmentName;
    data['branchName'] = this.branchName;
    return data;
  }
}
