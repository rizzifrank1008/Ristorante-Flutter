
class Category {
  final String id;
  final String title;
  final String color;

  Category({required this.id, required this.title, required this.color});

  factory Category.fromJson(Map<String, dynamic> data, String documentId) {
    return Category(
      id: documentId,
      title: data['title'] as String,
      color: data['color'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'color': color,
    };
  }
}
