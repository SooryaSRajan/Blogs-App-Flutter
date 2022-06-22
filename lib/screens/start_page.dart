import 'package:blog_app/screens/blogs_list.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Container()),
            const Text(
              "Blogs",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome to Flutter Blogs, share your thoughts and let people see them :)",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            Expanded(child: Container()),
            Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BlogsListPage()));
                    },
                    child: const Text("Continue")))
          ],
        ),
      ),
    );
  }
}
