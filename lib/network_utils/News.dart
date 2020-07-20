class News {
  final String headline;
  final String description;
  final String url;
  final String imgUrl;
  final String date;

  News( {this.headline, this.description, this.url,this.imgUrl, this.date});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      headline: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imgUrl: json['urlToImage'] as String,
      date: json['publishedAt'] as String
    );
  }
}