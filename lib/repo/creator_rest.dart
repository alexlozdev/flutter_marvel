import 'package:marvel/utility/log_utility.dart';

import '../model/marvel_data.dart';
import 'marvel_rest.dart';

class CreatorRest {
  static const urlGetCreators = '/v1/public/creators';

  /// call restapi for fetching all
  static Future<MarvelData?> getAll({
    int limit = MarvelRest.limit,
  }) {
    final headers = MarvelRest.getHeader(limit: limit);

    Uri apiUri = Uri.https(MarvelRest.urlMarvelApi, urlGetCreators, headers,);
    return MarvelRest.httpGetRequest(uri: apiUri).then((value) {
      if (value.status) {
        try {
          final marvelData = MarvelData.fromJson(value.body);
          return marvelData;
        } catch (e) {
          LogUtility.print(e);
        }
      }

      return null;
    });
  }
}