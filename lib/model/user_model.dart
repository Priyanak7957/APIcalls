class UserModel {
  String id;
  String name;
  String avatar;
  List<Posts> posts;

  UserModel({this.id, this.name, this.avatar, this.posts});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    print("=-=--=$id");
    name = json['name'];
    avatar = json['avatar'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    if (this.posts != null) {
      data['posts'] = this.posts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String id;
  String author;
  String title;
  String body;

  Posts({this.id, this.author, this.title, this.body});

  Posts.fromJson(Map<String, dynamic> json) {
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
