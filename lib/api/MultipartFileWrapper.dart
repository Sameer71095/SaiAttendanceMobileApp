import 'package:http/http.dart' as http;

class MultipartFileWrapper {
  http.MultipartFile file;

  MultipartFileWrapper(this.file);

  Map<String, dynamic> toJson() {
    return {
      'filename': file.filename,
      'contentType': file.contentType.toString(),
      // You can include other metadata if needed
    };
  }
}
