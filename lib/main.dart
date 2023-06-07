import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ambev/src/controller/home_controller.dart';
import 'package:test_ambev/src/shared/repositories/book_repository.dart';
import 'package:test_ambev/src/shared/services/http/http_service.dart';
import 'package:test_ambev/src/shared/services/http/http_service_impl.dart';
import 'package:test_ambev/src/shared/widgets/app_widget.dart';

void main() {
  runApp(
     MultiProvider(
      providers: [
        Provider<HttpService>(create:(_) => HttpServiceImp()),
        Provider<BookRepository>(create: (context) => BookRepository(httpService:context.read() ),),
        ChangeNotifierProvider(create: (context) => HomeController(bookRepository: context.read())),
      ],
      child: const AppWidget(),
    ),
);
}

