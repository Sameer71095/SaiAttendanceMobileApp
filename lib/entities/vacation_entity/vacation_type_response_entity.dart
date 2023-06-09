class VacationTypeResponseEntity {
   bool? isSuccess;
   String? message;
   List<VacationType>? data;

   VacationTypeResponseEntity({this.isSuccess, this.message, this.data});

   factory VacationTypeResponseEntity.fromJson(Map<String, dynamic> json) {
     var list = json['data'] as List?;
     List<VacationType> vacationTypeList = list != null
         ? list.map((i) => VacationType.fromJson(i)).toList()
         : [];

     return VacationTypeResponseEntity(
       isSuccess: json['isSuccess'],
       message: json['message'],
       data: vacationTypeList,
     );
   }
}

class VacationType {
  int? vacationTypeId;
  String? vacationTypeName;

  VacationType({required this.vacationTypeId, required this.vacationTypeName});

  factory VacationType.fromJson(Map<String, dynamic> json) {
    return VacationType(
      vacationTypeId: json['vacationTypeId'],  // Changed to 'vacationTypeId'
      vacationTypeName: json['vacationTypeName'],  // Changed to 'vacationTypeName'
    );
  }
}
