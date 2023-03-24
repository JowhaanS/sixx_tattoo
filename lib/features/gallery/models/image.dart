class Image {
  final String id;
  final String author;
  final String imageUrl;
  final bool isStencil;
  final String timeStamp;
  Image({
    required this.id,
    required this.author,
    required this.imageUrl,
    required this.isStencil,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'imageUrl': imageUrl,
      'isStencil': isStencil,
      'timeStamp': timeStamp,
    };
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      isStencil: json['isStencil'],
      timeStamp: json['timeStamp'],
    );
  }
}
