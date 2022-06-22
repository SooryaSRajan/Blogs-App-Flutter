import 'package:flutter/material.dart';

class BlogsListPage extends StatefulWidget {
  const BlogsListPage({Key? key}) : super(key: key);

  @override
  State<BlogsListPage> createState() => _BlogsListPageState();
}

class _BlogsListPageState extends State<BlogsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            child: ListTile(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add Blog"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
