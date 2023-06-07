import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ambev/src/controller/home_controller.dart';
import 'package:test_ambev/src/models/book.dart';
import 'package:test_ambev/src/view/details_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var controller = context.read<HomeController>();
      controller.loadFavoritsBooks();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Serch Book'),
      ),
      body: Consumer<HomeController>(builder: (_, controller, context) {
        if (controller.favoritsBooks.isEmpty && controller.books.isEmpty) {
          return Column(children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: SearchBar(
                hintText: 'Search',
                controller: searchFieldController,
                trailing: [
                  IconButton(
                    onPressed: () =>
                        controller.getBooksByTerm(searchFieldController.text),
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Você ainda não tem nenhum livro na sua lista de favoritos, pesquise por alguma palavra para encontrar livros que você goste',
                textAlign: TextAlign.center,
              ),
            )
          ]);
        }
        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: SearchBar(
                hintText: 'Search',
                controller: searchFieldController,
                trailing: [
                  IconButton(
                    onPressed: () =>
                        controller.getBooksByTerm(searchFieldController.text),
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: controller.books.isEmpty
                    ? controller.favoritsBooks.length
                    : controller.books.length,
                itemBuilder: (context, index) {
                  Book book = controller.books.isEmpty
                      ? controller.favoritsBooks[index]
                      : controller.books[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsBookPage(
                            book: book,
                          ),
                        ),
                      ),
                      child: ListTile(
                          title: Text(
                            book.volumeInfo!.title!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 65, 1, 95),
                            ),
                          ),
                          subtitle: book.volumeInfo!.subtitle == null
                              ? const Text('')
                              : Text(book.volumeInfo!.subtitle!),
                          leading: Container(
                            decoration: BoxDecoration(
                              color: book.volumeInfo!.imageLinks == null
                                  ? Colors.blue
                                  : null,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            width: 100,
                            height: 100,
                            child: book.volumeInfo!.imageLinks == null
                                ? const Icon(
                                    Icons.book,
                                    color: Colors.white,
                                  )
                                : Image.network(
                                    book.volumeInfo!.imageLinks!
                                        .smallThumbnail!,
                                  ),
                          ),
                          trailing: IconButton(
                            onPressed: () => book.isFavorite
                                ? controller.removeBookFromFavorits(book)
                                : controller.saveBookInFavorits(book),
                            icon: Icon(
                              Icons.favorite,
                              color: book.isFavorite ? Colors.red : Colors.grey,
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
