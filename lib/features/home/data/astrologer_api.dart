import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/astrologer.dart';

class AstrologerApi {
  static Future<List<Astrologer>> fetchAstrologers() async {
    final url = Uri.parse('https://devapiserver.bhaktam.com/astro/v6/getAstrologers');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'pageNo': 1,
        'pageSize': 10,
        'user_auth_id': 'eA7gibJFeaeGPbZP4Ef0bJHQFqf2',
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List result = jsonData['result'];
      return result.map((e) => Astrologer.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load astrologers');
    }
  }
}
