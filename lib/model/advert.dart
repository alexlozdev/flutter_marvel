class Advert {
  final String msg1;

  final String msg2;

  /// valid start date
  final String startDate;

  /// valid end date
  final String endDate;

  /// advertisement model
  const Advert({
    this.msg1 = '',
    this.msg2 = '',
    this.startDate = '',
    this.endDate = '',
  });
}