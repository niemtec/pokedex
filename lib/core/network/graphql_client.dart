import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final GraphQLClient client;

  GraphQLService({required this.client});

  factory GraphQLService.init() {
    final HttpLink httpLink =
        HttpLink('https://beta.pokeapi.co/graphql/v1beta');

    return GraphQLService(
      client: GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );
  }

  Future<QueryResult> query(String query,
      {Map<String, dynamic>? variables}) async {
    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );
    return await client.query(options);
  }
}
