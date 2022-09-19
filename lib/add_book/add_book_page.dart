import 'package:book_list_sample/add_book/add_book_model.dart';
import 'package:book_list_sample/book_list/book_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/book.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('本一覧'),
        ),
        body: Center(
            child: Consumer<AddBookModel>(builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                    decoration: const InputDecoration(hintText: '本のタイトルを入力'),
                    onChanged: (text) {
                      model.title = text;
                    }),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: '本の著者を入力'),
                  onChanged: (text) {
                    model.author = text;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        await model.addBook();
                        Navigator.of(context).pop(true);
                      } catch (e) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text('送信'))
              ],
            ),
          );
        })),
      ),
    );
  }
}
