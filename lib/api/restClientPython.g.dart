// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restClientPython.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClientPython implements RestClientPython {
  _RestClientPython(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://backend.clockspotter.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AttendanceResponseEntity> CheckInCheckOut(
    latitude,
    longitude,
    image,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Content-Type': 'application/json'};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (latitude != null) {
      _data.fields.add(MapEntry(
        'latitude',
        latitude.toString(),
      ));
    }
    if (longitude != null) {
      _data.fields.add(MapEntry(
        'longitude',
        longitude.toString(),
      ));
    }
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image!.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AttendanceResponseEntity>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/attendance/recognize',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AttendanceResponseEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterFaceResponseEntity> RegisterEmployeeImages(
    foldername,
    images,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (foldername != null) {
      _data.fields.add(MapEntry(
        'foldername',
        foldername,
      ));
    }
    _data.files.addAll(images.map((i) => MapEntry(
        'images',
        MultipartFile.fromFileSync(
          i!.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterFaceResponseEntity>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/employee/registerimages',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterFaceResponseEntity.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
