import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  Future addBook() async {
    if (title == null || title == '') {
      throw 'タイトルが入力されていません。';
    }

    if (author == null || author == '') {
      throw '著者が入力されていません。';
    }

    final book = <String, dynamic>{"title": title, "author": author};

    // firestoreに保存
    await FirebaseFirestore.instance.collection('books').add(book);
  }
}
