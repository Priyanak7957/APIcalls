class AllPost {
  String id;
  String author;
  String title;
  String body;

  AllPost({this.id, this.author, this.title, this.body});

  AllPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['author'] = this.author;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
