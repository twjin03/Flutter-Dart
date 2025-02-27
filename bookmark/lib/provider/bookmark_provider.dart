import 'dart:convert';
import 'package:bookmark/models/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkProvider with ChangeNotifier {
  List<Bookmark> _bookmarks = [];

  List<Bookmark> get bookmarks => _bookmarks;

  BookmarkProvider() {
    loadBookmarks();
  }

  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodeData = json.encode(
      _bookmarks
          .map((e) => {'id': e.id, 'title': e.title, 'checked': e.checked})
          .toList(),
    );
    await prefs.setString('bookmarks', encodeData);
  }

  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? bookmarksString = prefs.getString('bookmarks');
    if (bookmarksString != null) {
      final List<dynamic> bookmarkJson = json.decode(bookmarksString);
      _bookmarks =
          bookmarkJson
              .map(
                (e) => Bookmark(
                  id: e['id'],
                  title: e['title'],
                  checked: e['checked'],
                ),
              )
              .toList();
      notifyListeners();
    }
  }

  Future<void> addBookmark(Bookmark bookmark) async {
    _bookmarks.add(bookmark);
    await saveBookmarks();
    notifyListeners();
  }


  Future<void> toggleBookmark(String id) async {
    final bookmarkIndex = _bookmarks.indexWhere((element) => element.id == id);

    if (bookmarkIndex != -1) {
      _bookmarks[bookmarkIndex] = Bookmark(
        id: id,
        title: _bookmarks[bookmarkIndex].title,
        checked: !_bookmarks[bookmarkIndex].checked,
      );
    await saveBookmarks();
    notifyListeners();
    }
  }

  Future<void> removeBookmark(String id) async {
    _bookmarks.removeWhere((bookmark) => bookmark.id == id);
    await saveBookmarks();
    notifyListeners();
  }
}
