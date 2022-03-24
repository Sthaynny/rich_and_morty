import 'package:pop_network/pop_network.dart';

class CharacterDatasource {
  Future<ApiResult> getCharacter({
    String name = '',
    required int page,
  }) async {
    final Map<String, dynamic> query = {'page': page};
    if (name.isNotEmpty) {
      query['name'] = name;
    }
    final endpoint = Endpoint(
      suffixPath: '/character',
      queryParameters: query,
    );

    return await ApiManager.requestApi(endpoint: endpoint);
  }
}
