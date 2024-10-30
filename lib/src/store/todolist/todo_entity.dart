class Todo {
  Todo({required this.id, required this.content, this.isDelete = false});

  String id = '';
  String content = '';
  bool isDelete = false;

  void delete() {
    isDelete = true;
  }

  void update(newContent) {
    content = newContent;
  }
}
