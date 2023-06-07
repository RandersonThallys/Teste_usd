// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_ambev/src/models/book.dart';
import 'package:test_ambev/src/shared/repositories/book_repository.dart';
import 'package:test_ambev/src/shared/services/local_storage/shared_prefe.dart';

class HomeController extends ChangeNotifier {
  final BookRepository bookRepository;
  final SharedUtils sharedUtils;

  HomeController({
    required this.bookRepository,
    required this.sharedUtils,
  });

  List<Book> books = [];
  List<Book> favoritsBooks = [];
  int pagination = 0;

  loadFavoritsBooks() async {
    try {
      var result = await sharedUtils.getFavoritesBooks();
      if (result.isNotEmpty) {
        favoritsBooks.clear();
        favoritsBooks.addAll(result);
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  getBooksByTerm(String term) async {
    var result = await bookRepository.getBooksByTerm(term);
    books.clear();
    books.addAll(result);
    if (favoritsBooks.isNotEmpty) {
      for (Book book in books) {
        for (Book favoriteBook in favoritsBooks) {
          if (book.id == favoriteBook.id) {
            book.isFavorite = true;
            break;
          }
        }
      }
    }

    notifyListeners();
  }

  saveBookInFavorits(Book book) async {
    try {
      book.isFavorite = true;
      await sharedUtils.saveFavoriteBook(book);
      favoritsBooks.add(book);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  removeBookFromFavorits(Book book) async {
    try {
      await sharedUtils.removeFavoriteBook(book);
      favoritsBooks.remove(book);
      book.isFavorite = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
