class DepartmentResponse {
  final bool isSuccess;
  final String message;
  final List<Department> data;

  DepartmentResponse({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List?;
    List<Department> DepartmentList = list != null
        ? list.map((i) => Department.fromJson(i)).toList()
        : [];

    return DepartmentResponse(
      isSuccess: json['isSuccess'],
      message: json['message'],
      data: DepartmentList,
    );
  }
}

class Department {
  final int departmentId;
  final String departmentName;

  Department({
    required this.departmentId,
    required this.departmentName,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      departmentId: json['departmentId'],
      departmentName: json['departmentName'],
    );
  }
}
