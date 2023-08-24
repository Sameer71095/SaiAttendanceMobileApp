class LocationResponse {
  final bool isSuccess;
  final String message;
  final List<LocationNew> data;

  LocationResponse({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List?;
    List<LocationNew> locationList = list != null
        ? list.map((i) => LocationNew.fromJson(i)).toList()
        : [];

    return LocationResponse(
      isSuccess: json['isSuccess'],
      message: json['message'],
      data: locationList,
    );
  }
}

class LocationNew {
  final int locationId;
  final String name;

  LocationNew({
    required this.locationId,
    required this.name,
  });

  factory LocationNew.fromJson(Map<String, dynamic> json) {
    return LocationNew(
      locationId: json['locationId'],
      name: json['name'],
    );
  }
}
