import 'package:http/http.dart' as http;

import 'http_service.dart';

class HttpServiceImp implements HttpService {
  final Duration timeLimit = Duration(seconds: 30);
  final baseUrl = 'https://www.googleapis.com/books/v1/volumes';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Accept-Encoding': "gzip, deflate, br"
  };

  @override
  Future get<T>(
      {required String url,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) async {
    Uri uri;

    if (queryParameters != null) {
      uri = Uri.parse(baseUrl + url).replace(queryParameters: queryParameters);
    } else {
      uri = Uri.parse(baseUrl + url);
    }

    if (headers != null) {
      this.headers.addAll(headers);
    }
    var response =
        await http.get(uri, headers: this.headers).timeout(timeLimit);

    return response;
  }
}
