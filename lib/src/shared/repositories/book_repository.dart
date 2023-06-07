import 'package:test_ambev/src/models/book.dart';
import 'package:test_ambev/src/models/volumes.dart';
import 'package:test_ambev/src/shared/services/http/http_service.dart';

class BookRepository {
  final HttpService httpService;

  BookRepository({required this.httpService});

  Future<List<Book>> getBooksByTerm(String term) async {
    try {
      Volumes volume;
      var result = await httpService.get(url: '?q=$term&maxResults=40');
      if(result.statusCode == 200){

      volume = Volumes.fromJson(result.body);
      }else{
        volume = Volumes();
      }

      return volume.items!;
    } catch (e) {
      rethrow;
    }
  }
}
