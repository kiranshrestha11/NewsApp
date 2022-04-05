class NewsContentModel {
  final Source? source;
  final String? author, title, description, imgUrl, pubTime, content;

  NewsContentModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.imgUrl,
    this.pubTime,
    this.content,
  });

  factory NewsContentModel.fromJson(Map<String, dynamic> json) {
    return NewsContentModel(
      source: Source.fromJson(json['source']),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      imgUrl: json["urlToImage"],
      pubTime: json["publishedAt"],
      content: json['content'],
    );
  }
}

class Source {
  final String? id, name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
