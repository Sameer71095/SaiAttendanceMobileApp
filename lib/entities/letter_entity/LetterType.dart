class LetterTypeResponseEntity {
  bool? isSuccess;
  String? message;
  List<LetterType>? data;

  LetterTypeResponseEntity({this.isSuccess, this.message, this.data});

  factory LetterTypeResponseEntity.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List?;
    List<LetterType> LetterTypeList = list != null
        ? list.map((i) => LetterType.fromJson(i)).toList()
        : [];

    return LetterTypeResponseEntity(
      isSuccess: json['isSuccess'],
      message: json['message'],
      data: LetterTypeList,
    );
  }
}

class LetterType {
  int? LetterTypeId;
  String? LetterTypeName;

  LetterType({required this.LetterTypeId, required this.LetterTypeName});

  factory LetterType.fromJson(Map<String, dynamic> json) {
    return LetterType(
      LetterTypeId: json['letterTypeId'],  // Changed to 'vacationTypeId'
      LetterTypeName: json['letterTypeName'],  // Changed to 'vacationTypeName'
    );
  }
}
