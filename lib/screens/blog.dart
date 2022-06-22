import 'package:blog_app/model/blog_model.dart';
import 'package:flutter/material.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key, required this.data}) : super(key: key);

  final BlogModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "\"${data.blogTitle}\"",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  )),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "By ${data.authorName}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  )),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Published on ${data.date}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w200),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  data.blogContent!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
