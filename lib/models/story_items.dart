class storyitems {
  String? by;
  int? id;
  List? kids;
  int? parent;
  String? title;
  int? time;
  String? type;
  String? url;

  storyitems(
      {required this.by,
        required this.id,
        required this.kids,
        required this.parent,
        required this.title,
        required this.time,
        required this.type,
        required this.url});

  factory storyitems.fromJson(Map<String, dynamic> json) {
    return storyitems(
        by: json['by'],
        id: json['id'],
        kids: json['kids'],
        parent: json['parent'],
        title: json['title'],
        time: json['time'],
        type: json['type'],
        url: json['url']);
  }
}
