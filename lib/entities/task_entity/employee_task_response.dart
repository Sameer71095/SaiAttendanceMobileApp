class EmployeeTasksResponse {
  bool? isSuccess;
  String? message;
  List<EmployeeTask>? data;

  EmployeeTasksResponse({this.isSuccess, this.message, this.data});

  EmployeeTasksResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    if (json['data'] != null) {
      data = <EmployeeTask>[];
      json['data'].forEach((v) {
        data!.add(new EmployeeTask.fromJson(v));
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

class EmployeeTask {
  int? employeeTaskId;
  String? taskName;
  String? taskDescription;
  String? taskDate;
  String? taskStartTime;
  String? taskEndTime;
  String? name;
  bool? isTaskCompleted;

  EmployeeTask({this.employeeTaskId, this.taskName, this.taskDescription, this.taskDate, this.taskStartTime, this.taskEndTime, this.name, this.isTaskCompleted});

  EmployeeTask.fromJson(Map<String, dynamic> json) {
    employeeTaskId = json['employeeTaskId'];
    taskName = json['taskName'];
    taskDescription = json['taskDescription'];
    taskDate = json['taskDate'];
    taskStartTime = json['taskStartTime'];
    taskEndTime = json['taskEndTime'];
    name = json['name'];
    isTaskCompleted = json['isTaskCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeTaskId'] = this.employeeTaskId;
    data['taskName'] = this.taskName;
    data['taskDescription'] = this.taskDescription;
    data['taskDate'] = this.taskDate;
    data['taskStartTime'] = this.taskStartTime;
    data['taskEndTime'] = this.taskEndTime;
    data['name'] = this.name;
    data['isTaskCompleted'] = this.isTaskCompleted;
    return data;
  }
}
