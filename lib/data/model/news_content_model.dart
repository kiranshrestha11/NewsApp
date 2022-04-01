class NewsContentModel {
  final Source source;
  final String author, title, description, imgUrl, pubTime, content;

  NewsContentModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.pubTime,
    required this.content,
  });

  factory NewsContentModel.fromJson(Map<String, dynamic> json) {
    return NewsContentModel(
      source: Source.fromJson(json['source']),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      imgUrl: json["imgUrl"],
      pubTime: json["pubTime"],
      content: json['content'],
    );
  }
}

class Source {
  final String id, name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
