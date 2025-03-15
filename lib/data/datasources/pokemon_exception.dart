abstract class PokemonException implements Exception {
  final String message;
  const PokemonException(this.message);
}

class QueryException extends PokemonException {
  const QueryException(super.message);
}

class DataNotFoundException extends PokemonException {
  const DataNotFoundException(super.message);
}

class DataParsingException extends PokemonException {
  const DataParsingException(super.message);
}
