import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnlimitedAstro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const UnlimitedAstroPage(),
    );
  }
}

class UnlimitedAstroPage extends StatefulWidget {
  const UnlimitedAstroPage({super.key});

  @override
  State<UnlimitedAstroPage> createState() => _UnlimitedAstroPageState();
}

class _UnlimitedAstroPageState extends State<UnlimitedAstroPage> {
  late Future<List<Astrologer>> futureAstrologers;

  @override
  void initState() {
    super.initState();
    futureAstrologers = fetchAstrologers();
  }

  Future<List<Astrologer>> fetchAstrologers() async {
    final url = Uri.parse('https://apiserver.bhaktam.com/astro/v6/getAstrologers');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'pageNo': 1,
      'pageSize': 10,
      'user_auth_id': 'eA7gibJFeaeGPbZP4Ef0bJHQFqf2',
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> result = jsonData['result'];
        return result.map((data) => Astrologer.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load astrologers');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.circle, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'UnlimitedAstro',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Promo Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD97E3A), Color(0xFFC96B2E)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Consult Genuine Astrologer',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Unlimited Chat Minutes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Unlimited Call Minutes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Starting @151 rs',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.teal.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.stars, color: Colors.white, size: 40),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Choose Astrologer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Choose Astrologer to consult',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[700],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Astrologer Cards from API
            FutureBuilder<List<Astrologer>>(
              future: futureAstrologers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 280,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return SizedBox(
                    height: 280,
                    child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final astrologers = snapshot.data!;
                  return SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: astrologers.length,
                      itemBuilder: (context, index) {
                        final astro = astrologers[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: AstrologerCard(
                            name: astro.name,
                            specialties: astro.expertise.join(', '),
                            originalPrice: '₹${astro.price}',
                            discountedPrice: '₹${astro.discountedPrice}',
                            imageUrl: astro.picture,
                            experience: astro.experience,
                            gender: astro.gender,
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox(height: 280);
              },
            ),
            const SizedBox(height: 24),

            // Testimonial Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Words from Our Users',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '"',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'My daughter had been preparing for a government job for a long time but was not seeing any results. After consulting an astrologer on UnlimitedAstro, they advised that she should start a business as there was',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Spirituals'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Read'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
      ),
    );
  }
}

class AstrologerCard extends StatelessWidget {
  final String name;
  final String specialties;
  final String originalPrice;
  final String discountedPrice;
  final String imageUrl;
  final int experience;
  final String gender;

  const AstrologerCard({
    super.key,
    required this.name,
    required this.specialties,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
    required this.experience,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.teal,
                        child: const Icon(Icons.person,
                            color: Colors.white, size: 40),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              specialties,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$experience+ yrs',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  originalPrice,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  discountedPrice,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            color: Colors.yellow[100],
            child: const Text(
              'Unlimited Mins',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

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