class AddTaskRequest {
  String? taskName;
  String? taskDescription;
  int? taskTypeId;

  String? taskDate;  // Make sure to format this as 'yyyy-MM-dd'
  String? taskStartTime;  // Represent as 'HH:mm:ss'
  String? taskEndTime;  // Represent as 'HH:mm:ss'
  bool? isTaskCompleted;
  int? employeeId;

  AddTaskRequest({
    this.taskName,
    this.taskDescription,
    this.taskTypeId,
    this.taskDate,
    this.taskStartTime,
    this.taskEndTime,
    this.isTaskCompleted,
    this.employeeId
  });

  AddTaskRequest.fromJson(Map<String, dynamic> json) {
    taskName = json['taskName'];
    taskDescription = json['taskDescription'];
    taskTypeId = json['taskTypeId'];
    taskDate = json['taskDate'];
    taskStartTime = (json['taskStartTime'] != null ? new Time.fromJson(json['taskStartTime']) : null) as String?;
    taskEndTime = (json['taskEndTime'] != null ? new Time.fromJson(json['taskEndTime']) : null) as String?;
    isTaskCompleted = json['isTaskCompleted'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taskName'] = this.taskName;
    data['taskDescription'] = this.taskDescription;
    data['taskTypeId'] = this.taskTypeId;
    data['taskDate'] = this.taskDate;
    data['taskStartTime'] = this.taskStartTime;
    data['taskEndTime'] = this.taskEndTime;
    data['isTaskCompleted'] = this.isTaskCompleted;
    data['employeeId'] = this.employeeId;
    return data;
  }
}

class Time {
  int? ticks;

  Time({this.ticks});

  Time.fromJson(Map<String, dynamic> json) {
    ticks = json['ticks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticks'] = this.ticks;
    return data;
  }
}
