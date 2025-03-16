import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pokedex/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/data/models/pokemon_model.dart';

@GenerateNiceMocks([MockSpec<PokemonRemoteDataSource>()])
import 'pokemon_repository_test.mocks.dart';

void main() {
  late PokemonRepository repository;
  late MockPokemonRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockPokemonRemoteDataSource();
    repository = PokemonRepositoryImpl(mockDataSource);
  });

  group('getPokemons', () {
    final testPokemon = PokemonModel(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      sprite: 'test_sprite_url',
      types: ['grass', 'poison'],
      abilities: ['overgrow'],
    );

    test('should return list of Pokemon when the call is successful', () async {
      // arrange
      when(mockDataSource.fetchPokemons(
        limit: 10,
        offset: 0,
      )).thenAnswer((_) async => [testPokemon]);

      // act
      final result = await repository.getPokemons(limit: 10, offset: 0);

      // assert
      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.name, 'bulbasaur');
      verify(mockDataSource.fetchPokemons(limit: 10, offset: 0));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should throw exception when the call is unsuccessful', () async {
      // arrange
      when(mockDataSource.fetchPokemons(
        limit: 10,
        offset: 0,
      )).thenThrow(Exception('Failed to fetch Pokemon'));

      // act & assert
      expect(
        () => repository.getPokemons(limit: 10, offset: 0),
        throwsA(isA<Exception>()),
      );
    });
  });
}
