import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/book.dart';

class BookListModel extends ChangeNotifier {
  final _bookCollection = FirebaseFirestore.instance.collection('books');

  List<Book>? books;

  /// FireStoreから本一覧を取得
  void fetchBookList() async {

    final QuerySnapshot snapshot = await _bookCollection.get();
    final List<Book> books = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String title = data['title'];
      final String author = data['author'];
      return Book(title, author);
    }).toList();

    this.books = books;
    notifyListeners();
  }
}
