import 'package:flutter_dotenv/flutter_dotenv.dart';

Map<String, String> reqHeaders = {
  'api-key': apiKey,
  'client-id': clientId,
  'app-version': appVersion,
  'app-platform': appPlatform,
  'client': client,
  'Accept-language': language,
  // 'authorization': "Bearer $token"
};

final String apiKey = dotenv.env["APIKEY"]!;
final String clientId = dotenv.env["CLIENTID"]!;
final String appVersion = dotenv.env["VERSION"]!;
final String appPlatform = dotenv.env["PLATFORM"]!;
final String client = dotenv.env["CLIENT"]!;
final String language = dotenv.env["LANGUAGE"]!;
