import 'dart:convert';

class BlogModel {
  String? authorName;
  String? blogTitle;
  String? blogContent;
  String? date;

  BlogModel({this.date, this.authorName, this.blogContent, this.blogTitle});

  toJSON() {
    return {
      "blog": blogContent,
      "authorName": authorName,
      "blogTitle": blogTitle
    };
  }

  static BlogModel fromJSON(decodedData) {
    return BlogModel(
        date: decodedData['date'],
        authorName: decodedData['authorName'],
        blogContent: decodedData['blog'],
        blogTitle: decodedData['blogTitle']);
  }
}
