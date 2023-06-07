import 'package:flutter/material.dart';
import 'package:test_ambev/src/models/book.dart';
import 'package:test_ambev/src/shared/repositories/book_repository.dart';

class HomeController extends ChangeNotifier {
  final BookRepository bookRepository;

  HomeController({required this.bookRepository});

  List<Book> books = [];

  getBooksByTerm(String term) async {
    var result = await bookRepository.getBooksByTerm(term);
    books.clear();
    books.addAll(result);

    notifyListeners();
  }
}
