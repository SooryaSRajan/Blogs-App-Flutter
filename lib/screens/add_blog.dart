import 'dart:convert';

import 'package:blog_app/model/blog_model.dart';
import 'package:blog_app/widget/error_box.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBlog extends StatefulWidget {
  AddBlog({Key? key, required this.model}) : super(key: key);

  BlogModel model;

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Blog"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: errorBox(errorMessage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //This function validates data and checks if it is right
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Blog Title cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  //When form is validated, this function is called and value is given to user
                  widget.model.blogTitle = value!;
                },
                //The text box is decorated to look like a text box with label and hint in it
                decoration: const InputDecoration(
                    labelText: "Blog Title",
                    hintText: "Enter your blog Title here",
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //This function validates data and checks if it is right
                validator: (value) {
                  if (value == "" || value == null) {
                    return "Author Name cannot be empty";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  //When form is validated, this function is called and value is given to user
                  widget.model.authorName = value!;
                },
                //The text box is decorated to look like a text box with label and hint in it
                decoration: const InputDecoration(
                    labelText: "Author Name",
                    hintText: "Enter Author Name here",
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  expands: true,
                  //This function validates data and checks if it is right
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "Blog cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  maxLines: null,
                  onSaved: (value) {
                    //When form is validated, this function is called and value is given to user
                    widget.model.blogContent = value!;
                  },
                  //The text box is decorated to look like a text box with label and hint in it
                  decoration: const InputDecoration(
                      labelText: "Blog",
                      hintText: "Enter your blog content here",
                      filled: true,
                      border: OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            setState(() {
              errorMessage = "";
            });

            var uri =
                Uri.parse("https://flutter-blogs.herokuapp.com/blog/addBlog");
            var res = await http.post(uri, body: widget.model.toJSON());
            if (res.statusCode == 200) {
              Navigator.pop(context);
            } else {
              setState(() {
                errorMessage = json.decode(res.body)['message'];
              });
            }
          }
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
