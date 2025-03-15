import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  final SharedPreferences prefs;
  static const String _pokemonCacheKey = 'pokemon_cache';
  static const Duration _cacheExpiration = Duration(hours: 24);

  CacheService({required this.prefs});

  Future<void> cachePokemonData(List<Map<String, dynamic>> data) async {
    final cacheData = {
      'timestamp': DateTime.now().toIso8601String(),
      'data': data,
    };
    await prefs.setString(_pokemonCacheKey, jsonEncode(cacheData));
  }

  Future<List<Map<String, dynamic>>?> getCachedPokemonData() async {
    final cachedJson = prefs.getString(_pokemonCacheKey);
    if (cachedJson == null) return null;

    final cached = jsonDecode(cachedJson) as Map<String, dynamic>;
    final timestamp = DateTime.parse(cached['timestamp'] as String);

    if (DateTime.now().difference(timestamp) > _cacheExpiration) {
      await prefs.remove(_pokemonCacheKey);
      return null;
    }

    return List<Map<String, dynamic>>.from(cached['data'] as List);
  }

  Future<void> clearCache() async {
    await prefs.remove(_pokemonCacheKey);
  }
}
