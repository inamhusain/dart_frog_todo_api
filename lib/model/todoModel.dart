// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_this,
class TodoModel {
  dynamic cursor;
  List<Items>? items;
  dynamic nextPage;

  TodoModel({this.cursor, this.items, this.nextPage});

  TodoModel.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    if (json['items'] != null) {
      items = <Items>[];
      // ignore: avoid_dynamic_calls
      json['items'].forEach((Map<String, dynamic> v) {
        items!.add(Items.fromJson(v));
      });
    }
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cursor'] = this.cursor;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['next_page'] = this.nextPage;
    return data;
  }
}

class Items {
  String? id;
  bool completed = false;
  String title = '';

  Items({this.id, required this.completed, required this.title});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    completed = json['completed'] as bool;
    title = json['title'].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = this.id;
    data['completed'] = this.completed;
    data['title'] = this.title;
    return data;
  }
}
