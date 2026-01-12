import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const orangeColor = Color(0xFFC95524);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // Title
              const Text(
                "Register your phone no.",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 24),

              // Benefits
              _buildPoint("Earn Astro Mudra"),
              _buildPoint("Get Discount on Consultations"),
              _buildPoint("Consult an Astrologer"),

              const SizedBox(height: 32),

              // Phone Input
              Row(
                children: [
                  // Country Code
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text("🇮🇳", style: TextStyle(fontSize: 18)),
                        SizedBox(width: 6),
                        Text(
                          "+91",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Phone Field
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Get OTP Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: OTP Logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "GET OTP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable bullet point
  Widget _buildPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: const [
          Icon(Icons.check_circle, color: Colors.grey),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    ).copyWithText(text);
  }
}

// Small extension to keep code clean
extension _RowText on Widget {
  Widget copyWithText(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.grey),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
