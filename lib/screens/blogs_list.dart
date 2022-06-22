import 'dart:convert';

import 'package:blog_app/model/blog_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogsListPage extends StatefulWidget {
  const BlogsListPage({Key? key}) : super(key: key);

  @override
  State<BlogsListPage> createState() => _BlogsListPageState();
}

class _BlogsListPageState extends State<BlogsListPage> {
  List<BlogModel> list = [];

  _getData() async {
    //parse our URL
    var uri = Uri.parse("https://flutter-blogs.herokuapp.com/blog/getBlogs");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"]; //List Data
      for (var i in data) {
        setState(() {
          list.add(BlogModel.fromJSON(i));
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blogs"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _getData();
        },
        child:
        list.isNotEmpty ?
        ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text("\"${list[index].blogTitle}\""),
                subtitle: Text("By ${list[index].authorName}"),
                // leading: Text(list[index].date ?? "date"),
              ),
            );
          },
        ) : SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height
                ),
                child: Center(child: const Text("No blogs yet, check back later :)"))
            )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add Blog"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
