import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key}); // 기본 생성자 함수 

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Text('The form'), // 수정 예정
      ),
    );
  }
}
