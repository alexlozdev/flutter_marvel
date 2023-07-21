import 'package:marvel/utility/log_utility.dart';

import '../model/marvel_data.dart';
import 'marvel_rest.dart';

class StoryRest {
  static const urlGetStories = '/v1/public/stories';

  /// call restapi for fetching all
  static Future<MarvelData?> getAll({
    int limit = MarvelRest.limit,
  }) {
    final headers = MarvelRest.getHeader(limit: limit);

    Uri apiUri = Uri.https(MarvelRest.urlMarvelApi, urlGetStories, headers,);
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