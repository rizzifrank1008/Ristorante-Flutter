class ProductDetails {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final String complexity;
  final bool isVegan;
  final List<String> categories;
  final double price; // Ensure this is never null
  final List<String> steps; // New attribute for steps

  ProductDetails({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.isVegan,
    required this.categories,
    required this.price,
    required this.steps, // Initialize the new attribute in the constructor
  });

  factory ProductDetails.fromJson(Map<String, dynamic> data, String documentId) {
    if (data == null || data.isEmpty) {
      throw Exception("Data is null or empty");
    }

    final List<String> categories = (data['categories'] as List<dynamic>).map((category) => category.toString()).toList();
    final List<String> steps = (data['steps'] as List<dynamic>?)?.map((step) => step.toString())?.toList() ?? []; // Safely parse the steps list

    double parsedPrice = 0.0; // Default price
    try {
      parsedPrice = (data['price'] as num?)?.toDouble() ?? 0.0; // Safely attempt to parse the price
    } catch (e) {
      print("Failed to parse price: $e");
    }

    return ProductDetails(
      id: documentId,
      title: data['title'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      duration: data['duration'] as int? ?? 0,
      complexity: data['complexity'] as String? ?? '',
      isVegan: data['isVegan'] as bool? ?? false,
      categories: categories,
      price: parsedPrice,
      steps: steps, // Pass the parsed steps to the constructor
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
      'price': price,
      'steps': steps, // Include steps in the serialized output
    };
  }
}
