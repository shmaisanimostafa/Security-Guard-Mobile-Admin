class Article {
  final String title;
  final int id;
  final int rating;
  final String body1;
  final String body2;
  final String imgUrl;
  final String url;

  Article({
    required this.id,
    required this.title,
    required this.body1,
    required this.body2,
    required this.imgUrl,
    required this.url,
    required this.rating,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      url: json['url'],
      imgUrl: json['imgUrl'] ?? '',
      rating: json['rating'],
      id: json['id'],
      title: json['title'],
      body1: json['body1'],
      body2: json['body2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'imgUrl': imgUrl,
      'rating': rating,
      'id': id,
      'title': title,
      'body1': body1,
      'body2': body2,
    };
  }
}
