import 'package:flutter/material.dart';
import '../models/astrologer.dart';
import '../widgets/astrologer_card.dart';

class AstrologerSection extends StatelessWidget {
  final Future<List<Astrologer>> futureAstrologers;

  const AstrologerSection({super.key, required this.futureAstrologers});

  static const orangeColor = Color(0xFFC95524);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 12),
          child: const Text(
            "Choose Astrologer to consult",
            style: TextStyle(
              color: orangeColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          height: 310,
          child: FutureBuilder<List<Astrologer>>(
            future: futureAstrologers,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final astro = snapshot.data![index];
                  return AstrologerCard(
                    name: astro.name,
                    specialties: astro.expertise.join(', '),
                    originalPrice: '₹${astro.price}',
                    discountedPrice: '₹${astro.discountedPrice}',
                    imageUrl: astro.picture,
                    experience: astro.experience,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
