class Product {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final String complexity;
  final bool isVegan;
  final List<String> categories; // Mantieni il tipo come List<String>

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.isVegan,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> data, String documentId) {
    if (data == null || data.isEmpty) {
      throw Exception("Data is null or empty");
    }

    // Converti il campo categories da dynamic a List<String>
    final List<String> categories = (data['categories'] as List<dynamic>)
        .map((category) => category.toString())
        .toList();

    return Product(
      id: documentId,
      title: data['title'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      duration: data['duration'] as int? ?? 0,
      complexity: data['complexity'] as String? ?? '',
      isVegan: data['isVegan'] as bool? ?? false,
      categories: categories, // Assegna il valore convertito al campo categories
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'duration': duration,
      'complexity': complexity,
      'isVegan': isVegan,
      'categories': categories,
    };
  }
}
