import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:iMyPet/app/pages/raca/raca_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  RacaRepository repository;
  MockClient client;

  setUp(() {
    repository = RacaRepository();
    client = MockClient();
  });

  group('RacaRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<RacaRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.fetchPost(client);
      expect(data['title'], 'Test');
    });
  });
}
