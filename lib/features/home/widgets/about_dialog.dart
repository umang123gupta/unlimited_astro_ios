import 'package:flutter/material.dart';

void showUnlimitedAstroAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Why Choose UnlimitedAstro?",
                    style: TextStyle(
                      color: const Color(0xFFC95524),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.of(context).pop(),
                  //   child: const Icon(Icons.close, size: 24),
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   At UnlimitedAstro, we offer an unparalleled feature—unlimited talk time with our astrologers. We believe that meaningful guidance requires time, and you deserve the freedom to explore your concerns without worrying about limits. Whether it’s relationships, career, health, or personal growth, our astrologers are here to listen and provide thoughtful, personalized solutions.\n',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                      const Text(
                        '   Our mission goes beyond just offering convenience. Our goal is to challenge misconceptions surrounding astrology and provide a clearer understanding of its significance. Sadly, astrology’s reputation has been tarnished by those who lack proper knowledge and use it as a tool to exploit. At UnlimitedAstro, we are committed to changing this perception. Our astrologers are not here to scam or profit unethically; they are experienced, compassionate, and genuinely dedicated to helping you.\n',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                      const Text(
                        '   Astrology is an ancient knowledge that, when practiced authentically, can bring clarity and wisdom into your life. At UnlimitedAstro, we honor this tradition by building trust and ensuring that every interaction you have with us is meaningful and sincere.\n',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                      const Text(
                        '   Join us in rediscovering astrology’s true essence, with a team that places your well-being above all else. UnlimitedAstro is here to help you navigate life’s challenges, one conversation at a time.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC95524),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}