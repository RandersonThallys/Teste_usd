import 'package:flutter/material.dart';
import 'package:test_ambev/src/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsBookPage extends StatefulWidget {
  final Book book;
  const DetailsBookPage({
    required this.book,
    super.key,
  });

  @override
  State<DetailsBookPage> createState() => _DetailsBookPageState();
}

class _DetailsBookPageState extends State<DetailsBookPage> {
  Future<void> _launchUrl(String url) async {
    if (await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Book Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2),
                ),
                Positioned(
                  left: 300,
                  top: 210,
                  child: ElevatedButton(
                      onPressed: widget.book.saleInfo!.saleability == 'FOR_SALE'
                          ? () async {
                              _launchUrl(widget.book.saleInfo!.buyLink!);
                            }
                          : null,
                      child: const Text('\$ Comprar ')),
                ),
                Positioned(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: widget.book.volumeInfo!.imageLinks == null
                              ? const Icon(Icons.book)
                              : Image.network(
                                  widget
                                      .book.volumeInfo!.imageLinks!.thumbnail!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(
                15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          widget.book.volumeInfo!.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color:
                            widget.book.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ],
                  ),
                  ...widget.book.volumeInfo!.authors!.map(
                    (author) => Text(
                      author,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      widget.book.volumeInfo!.publishedDate!.isEmpty
                          ? 'Data de publicação: Sem informação'
                          : 'Data de publicação: ${widget.book.volumeInfo!.publishedDate!.substring(0, 4)}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    widget.book.volumeInfo!.description!.isEmpty
                        ? 'Sem descrição'
                        : widget.book.volumeInfo!.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
