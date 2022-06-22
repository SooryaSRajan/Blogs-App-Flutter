import 'dart:convert';

class BlogModel {
  String? authorName;
  String? blogTitle;
  String? blogContent;
  String? date;

  BlogModel({this.date, this.authorName, this.blogContent, this.blogTitle});

  String toJSON() {
    return json.encode({
      "blog": blogContent,
      "authorName": authorName,
      "blogTitle": blogTitle
    });
  }

  BlogModel fromJSON(String data) {
    var decodedData = json.decode(data);
    return BlogModel(
        date: decodedData['date'],
        authorName: decodedData['authorName'],
        blogContent: decodedData['blog'],
        blogTitle: decodedData['blogTitle']);
  }
}
