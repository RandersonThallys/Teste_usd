import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_ambev/src/controller/home_controller.dart';
import 'package:test_ambev/src/view/details_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Serch Book'),
      ),
      body: Consumer<HomeController>(builder: (_, controller, context) {
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
                itemCount: controller.books.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsBookPage(
                          book: controller.books[index],
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        controller.books[index].volumeInfo!.title!,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 65, 1, 95),
                        ),
                      ),
                      subtitle: controller.books[index].volumeInfo!.subtitle ==
                              null
                          ? const Text('')
                          : Text(controller.books[index].volumeInfo!.subtitle!),
                      leading: Container(
                        decoration: BoxDecoration(
                          color:
                              controller.books[index].volumeInfo!.imageLinks ==
                                      null
                                  ? Colors.blue
                                  : null,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        width: 100,
                        height: 100,
                        child: controller.books[index].volumeInfo!.imageLinks ==
                                null
                            ? const Icon(
                                Icons.book,
                                color: Colors.white,
                              )
                            : Image.network(
                                controller.books[index].volumeInfo!.imageLinks!
                                    .smallThumbnail!,
                              ),
                      ),
                      trailing: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
