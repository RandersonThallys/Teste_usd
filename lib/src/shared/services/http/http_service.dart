

abstract class HttpService{
  Future<dynamic> get<T>({required String url,Map<String, String> headers});
}