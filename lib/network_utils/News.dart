class News {
  final String headline;
  final String description;
  final String url;
  final String imgUrl;
  //final DateTime date;

  News( {this.headline, this.description, this.url,this.imgUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      headline: json['headline'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imgUrl: json['imgUrl'] as String,
    );
  }
}