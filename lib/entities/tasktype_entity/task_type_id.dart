/// isSuccess : true
/// message : ""
/// data : [{"taskTypeId":1,"name":"MEETING"},{"taskTypeId":2,"name":"DEVELOPMENT"},{"taskTypeId":3,"name":"RESEARCH"},{"taskTypeId":4,"name":"DOCUMENTATION"},{"taskTypeId":5,"name":"TESTING"},{"taskTypeId":6,"name":"REVIEW"},{"taskTypeId":7,"name":"EMAIL_COMMUNICATION"},{"taskTypeId":8,"name":"MAINTENANCE"},{"taskTypeId":9,"name":"SLEEP"},{"taskTypeId":10,"name":"BREAK"},{"taskTypeId":11,"name":"MEAL_PREP"},{"taskTypeId":12,"name":"PERSONAL_BREAK"},{"taskTypeId":13,"name":"PHYSICAL_EXERCISE"},{"taskTypeId":14,"name":"TRAINING"},{"taskTypeId":15,"name":"PROJECT_MANAGEMENT"},{"taskTypeId":16,"name":"BRAINSTORMING"},{"taskTypeId":17,"name":"STRATEGY"},{"taskTypeId":18,"name":"PLANNING"},{"taskTypeId":19,"name":"ANALYSIS"},{"taskTypeId":20,"name":"CUSTOMER_SUPPORT"},{"taskTypeId":21,"name":"QUALITY_ASSURANCE"},{"taskTypeId":22,"name":"SYSTEM_ADMINISTRATION"},{"taskTypeId":23,"name":"NETWORKING"},{"taskTypeId":24,"name":"CONSULTATION"},{"taskTypeId":25,"name":"PRESENTATION"},{"taskTypeId":26,"name":"DESIGN"},{"taskTypeId":27,"name":"FAMILY_TIME"},{"taskTypeId":28,"name":"HOBBY_TIME"},{"taskTypeId":29,"name":"HEALTH_CARE"},{"taskTypeId":30,"name":"MEDITATION"},{"taskTypeId":31,"name":"Others"}]

class TaskTypeId {
  TaskTypeId({
      bool? isSuccess, 
      String? message, 
      List<Data>? data,}){
    _isSuccess = isSuccess;
    _message = message;
    _data = data;
}

  TaskTypeId.fromJson(dynamic json) {
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _isSuccess;
  String? _message;
  List<Data>? _data;
TaskTypeId copyWith({  bool? isSuccess,
  String? message,
  List<Data>? data,
}) => TaskTypeId(  isSuccess: isSuccess ?? _isSuccess,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get isSuccess => _isSuccess;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isSuccess'] = _isSuccess;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// taskTypeId : 1
/// name : "MEETING"

class Data {
  Data({
    num? taskTypeId,
    String? name,}) {
    _taskTypeId = taskTypeId;
    _name = name;
  }

  Data.fromJson(dynamic json) {
    _taskTypeId = json['taskTypeId'];
    _name = json['name'];
  }

  num? _taskTypeId;
  String? _name;

  Data copyWith({ num? taskTypeId,
    String? name,
  }) =>
      Data(taskTypeId: taskTypeId ?? _taskTypeId,
        name: name ?? _name,
      );

  num? get taskTypeId => _taskTypeId;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taskTypeId'] = _taskTypeId;
    map['name'] = _name;
    return map;
  }

}