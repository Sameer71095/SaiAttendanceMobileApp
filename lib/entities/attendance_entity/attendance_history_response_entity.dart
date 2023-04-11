class AttendanceHistoryResponse {
  bool? isSuccess;
  String? message;
  List<Data>? data;

  AttendanceHistoryResponse({this.isSuccess, this.message, this.data});

  AttendanceHistoryResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? employeeId;
  String? employeeName;
  String? checkedDate;
  double? totalHours;
  List<Checked>? checked;

  Data(
      {this.employeeId,
        this.employeeName,
        this.checkedDate,
        this.totalHours,
        this.checked});

  Data.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    checkedDate = json['checkedDate'];
    totalHours = json['totalHours'];
    if (json['checked'] != null) {
      checked = <Checked>[];
      json['checked'].forEach((v) {
        checked!.add(new Checked.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['employeeName'] = this.employeeName;
    data['checkedDate'] = this.checkedDate;
    data['totalHours'] = this.totalHours;
    if (this.checked != null) {
      data['checked'] = this.checked!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Checked {
  int? attendanceId;
  String? checkedTime;
  bool? isCheckedout;

  Checked({this.attendanceId, this.checkedTime, this.isCheckedout});

  Checked.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendanceId'];
    checkedTime = json['checkedTime'];
    isCheckedout = json['isCheckedout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendanceId'] = this.attendanceId;
    data['checkedTime'] = this.checkedTime;
    data['isCheckedout'] = this.isCheckedout;
    return data;
  }
}