import 'package:flutter/material.dart';

class WhyChooseSection extends StatelessWidget {
  final VoidCallback onReadMore;

  const WhyChooseSection({super.key, required this.onReadMore});

  static const orangeColor = Color(0xFFC95524);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBE6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black38),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Choose UnlimitedAstro App for Astrology?",
            style: TextStyle(
              color: orangeColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '   At UnlimitedAstro, we offer an unparalleled feature—unlimited talk time with our astrologers. We believe that meaningful guidance requires time, and you deserve the freedom to explore your concerns without worrying about limits. Whether it’s relationships, career, health, or personal growth, our astrologers are here to listen and provide thoughtful, personalized solutions.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const Text(
            '   Our mission goes beyond just offering convenience. Our goal is to challenge misconceptions surrounding astrology and provide a clearer under...',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onReadMore,
            child: Text(
              'Read More',
              style: TextStyle(
                color: orangeColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
