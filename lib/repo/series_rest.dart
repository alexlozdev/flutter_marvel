import 'package:http/http.dart';
import 'package:marvel/utility/log_utility.dart';

import '../model/good.dart';
import '../model/marvel_data.dart';
import 'marvel_rest.dart';

class SeriesRest {
  static const urlGetSeries = '/v1/public/series';

  /// call restapi for fetching characters
  static Future<MarvelData?> getAll({
    int limit = MarvelRest.limit,
  }) {
    final headers = MarvelRest.getHeader(limit: limit);

    Uri apiUri = Uri.https(MarvelRest.urlMarvelApi, urlGetSeries, headers,);
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