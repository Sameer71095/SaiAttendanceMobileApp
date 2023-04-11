class AttendanceHistoryRequest {
  int? employeeId;
  int? monthId;

  AttendanceHistoryRequest({this.employeeId, this.monthId});

  AttendanceHistoryRequest.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    monthId = json['monthId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['monthId'] = this.monthId;
    return data;
  }
}
