import 'package:flutter/foundation.dart';
import 'package:railway_chopper/railway_chopper.dart';

Future<void> main() async {
  // Build a preconfigured client. In a real app, attach your generated
  // `@ChopperApi` services to it instead of calling `client.get` directly.
  final client = buildChopperClient(
    baseUrl: 'https://jsonplaceholder.typicode.com',
  );

  final result = await mapResponse(
    () => client.get<Map<String, dynamic>, Map<String, dynamic>>(
      Uri.parse('/todos/1'),
    ),
  );

  result.match(
    (failure) => debugPrint('Request failed: $failure'),
    (todo) => debugPrint('Todo #${todo['id']}: ${todo['title']}'),
  );

  client.dispose();
}
