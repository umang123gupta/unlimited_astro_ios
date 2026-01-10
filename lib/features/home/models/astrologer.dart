class Astrologer {
  final String name;
  final String picture;
  final String gender;
  final int price;
  final int discountedPrice;
  final List<String> expertise;
  final int experience;
  final List<String> languages;

  Astrologer({
    required this.name,
    required this.picture,
    required this.gender,
    required this.price,
    required this.discountedPrice,
    required this.expertise,
    required this.experience,
    required this.languages,
  });

  factory Astrologer.fromJson(Map<String, dynamic> json) {
    return Astrologer(
      name: json['name'] ?? 'Unknown',
      picture: json['picture'] ?? '',
      gender: json['gender'] ?? 'Not specified',
      price: json['price'] ?? 0,
      discountedPrice: json['discounted_price'] ?? 0,
      expertise: List<String>.from(json['expertise'] ?? []),
      experience: json['experience'] ?? 0,
      languages: List<String>.from(json['languages'] ?? []),
    );
  }
}
