class AttendanceResponseEntity {
  bool? isSuccess;
  String? errorMessage;
  String? data;

  AttendanceResponseEntity({this.isSuccess, this.errorMessage, this.data});

  AttendanceResponseEntity.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    data['data'] = this.data;
    return data;
  }
}