import 'dart:convert';

import 'package:test_ambev/src/models/book.dart';
import 'package:test_ambev/src/shared/services/local_storage/local_storage.dart';

class SharedUtils {
  final LocalStorage localStorage;

  SharedUtils({required this.localStorage});

  final String sharedKey = "favorite_books";

  Future<List<Book>> getFavoritesBooks() async {
    List<Book> books = [];

    if (localStorage.contains(key: sharedKey)){
      var booksJson = json.decode(await localStorage.load(key: sharedKey) as String) as List;

      books = booksJson.map((book) => Book.fromJson(book)).toList();
    }

    return books;
  }

  Future<void> saveFavoriteBook(Book book) async {
    List<Book> books = [];

    if (localStorage.contains(key: sharedKey)){
      var booksJson = json.decode(await localStorage.load(key: sharedKey) as String) as List;

      books = booksJson.map((book) => Book.fromJson(book)).toList();
    }

    books.add(book);

    await localStorage.save(key: sharedKey, value: json.encode(books));
  }

  Future<void> removeFavoriteBook(Book book) async {
    List<Book> books = [];

    var booksJson = json.decode(await localStorage.load(key: sharedKey) as String) as List;

    books = booksJson.map((book) => Book.fromJson(book)).toList();

    books.removeWhere((element) => element.id == book.id);

    await localStorage.save(key: sharedKey, value: json.encode(books));
  }
}
