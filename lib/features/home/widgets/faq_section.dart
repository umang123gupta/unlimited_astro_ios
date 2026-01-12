import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  static const orangeColor = Color(0xFFC95524);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[600]!, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Frequently Asked Questions",
            style: TextStyle(
              color: orangeColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildFAQItem(
            "What makes UnlimitedAstro different from other astrology apps?",
            "At UnlimitedAstro, we offer unlimited talk time with genuine and experienced astrologers who are here to truly help you, not just to make money. Our mission is to restore trust in astrology by providing honest and personalized guidance tailored to your unique concerns.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "How does unlimited talk time work?",
            "Unlimited talk time means there are no time limits when you consult with our astrologers. You can take all the time you need to discuss your concerns, ask questions, and get the clarity you deserve.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "After the amount is paid, how many times can I take the session?",
            "The amount is valid for only one session. Once the consultation has started, the session is considered to be started. You have to be available for the session to continue the conversation. In case you are not responding, the system will automatically end the chat and mark as completed.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "How do I book a session with an astrologer?",
            "If you need to reschedule, you can do so through the app or by contacting our customer care. We understand that life can be unpredictable, and we want to accommodate your needs.",
          ),

          const SizedBox(height: 14),
          _buildFAQItem(
            "What if I need to reschedule my session?",
            "If you need to reschedule, you can do so through the app or by contacting our customer care. We understand that life can be unpredictable, and we want to accommodate your needs.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "How do I know which astrologer is right for me?",
            "You can read the profiles and reviews of our astrologers to find one that resonates with your needs. Each astrologer has their own expertise and approach, so take your time to choose the one that feels right for you.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "How many questions can I ask on one call?",
            "You can ask as many questions as you want during one call, provided they are related to one birth detail or one hand (can be yours, a family member's, or a friend's). Similarly, for tarot card readings, you can ask unlimited questions for one person’s reading. If you wish to discuss readings for another person, you would need to connect on a separate call.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "What can I ask the astrologers?",
            "You can ask about any aspect of your life, including relationships, career, health, finances, and personal growth. Whether you're looking for clarity, solutions, or just peace of mind, our astrologers are here to guide you.",
          ),
          const SizedBox(height: 14),
          _buildFAQItem(
            "Are my details and conversations secure?",
            "Yes, we prioritize your privacy. All your details and conversations with our astrologers are completely confidential and handled with the utmost care.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          answer,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
