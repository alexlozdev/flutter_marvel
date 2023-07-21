
import 'package:equatable/equatable.dart';

import '../utility/json_utility.dart';
import '../utility/log_utility.dart';
import 'good.dart';

/// marvel response data
class MarvelData extends Equatable {
  static const keyOffset = 'offset';
  static const keyLimit = 'limit';
  static const keyTotal = 'total';
  static const keyCount = 'count';
  static const keyResults = 'results';

  final int offset;

  final int limit;

  final int total;

  final int count;

  final List<dynamic> results;

  const MarvelData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  MarvelData copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<dynamic>? results,
  }) {
    return MarvelData(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      total: total ?? this.total,
      count: count ?? this.count,
      results: results ?? this.results,
    );
  }

  @override
  List<Object?> get props => [offset, limit, total, count, count, results];

  /// parsing json
  static fromJson(Map<String, dynamic> map) {
    return MarvelData(
        offset: JsonUtility.getIntValueFromMap(map, keyOffset, 0),
        limit: JsonUtility.getIntValueFromMap(map, keyLimit, 0),
        total: JsonUtility.getIntValueFromMap(map, keyTotal, 0),
        count: JsonUtility.getIntValueFromMap(map, keyCount, 0),
        results: JsonUtility.getDynamicListValueFromMap(map, keyResults, []),
    );
  }

  /// convert results map to goods object list
  List<Good> getGoods({String? searchKey}) {
    final List<Good> goods = [];
    for (dynamic item in results) {
      try {
        Map<String, dynamic> mapItem = item;
        final Good good = Good.fromJson(mapItem);

        // filter by serach key
        if (searchKey != null) {
          final lowerSearchKey = searchKey.toLowerCase();
          if (good.name.toLowerCase().contains(lowerSearchKey) || good.description.toLowerCase().contains(lowerSearchKey)) {
            goods.add(good);
          }
        } else {
          goods.add(good);
        }
      } catch (e) {
        LogUtility.print(e);
      }
    }

    return goods;
  }
}