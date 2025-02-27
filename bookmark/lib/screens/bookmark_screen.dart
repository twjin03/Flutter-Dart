import 'package:bookmark/models/bookmark.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookmark/provider/bookmark_provider.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('북마크')),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, child) {
          final bookmarks = provider.bookmarks;
          if (bookmarks.isEmpty) {
            return Center(child: Text('북마크가 비어있습니다.'));
          } else {
            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = bookmarks[index];
                return ListTile(
                  title: Text(bookmark.title),
                  leading: Checkbox(
                    value: bookmark.checked,
                    onChanged: (value) {
                      provider.toggleBookmark(bookmark.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newBookmark = Bookmark(
            id: DateTime.now().toString(),
            title: '새로운 북마크',
            checked: false,
          );
          Provider.of<BookmarkProvider>(
            context,
            listen: false,
          ).addBookmark(newBookmark);
        },
      ),
    );
  }
}
