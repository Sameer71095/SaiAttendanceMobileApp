class TaskTypeResponseEntity {
  bool? isSuccess;
  String? message;
  List<TaskType>? data;

  TaskTypeResponseEntity({this.isSuccess, this.message, this.data});

  factory TaskTypeResponseEntity.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List?;
    List<TaskType> TaskTypeList = list != null
        ? list.map((i) => TaskType.fromJson(i)).toList()
        : [];

    return TaskTypeResponseEntity(
      isSuccess: json['isSuccess'],
      message: json['message'],
      data: TaskTypeList,
    );
  }
}

class TaskType {
  int? TaskTypeId;
  String? TaskTypeName;

  TaskType({required this.TaskTypeId, required this.TaskTypeName});

  factory TaskType.fromJson(Map<String, dynamic> json) {
    return TaskType(
      TaskTypeId: json['taskTypeId'],  // Changed to 'vacationTypeId'
      TaskTypeName: json['name'],  // Changed to 'vacationTypeName'
    );
  }
}
