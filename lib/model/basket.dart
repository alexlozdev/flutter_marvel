
class Basket {
  /// good items in shopping basket.
  /// <good id, buying count>
  Map<String, int> items = {};

  /// limit of items in basket
  final int maxCount;

  /// shopping basket model
  Basket({
    this.items = const {},
    this.maxCount = 10,
  });

  /// get all good counts in basket
  int getCounts() {
    int count = 0;

    for (String itemKey in items.keys) {
      int value = items[itemKey] ?? 0;
      count += value;
    }

    return count;
  }

}