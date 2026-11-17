abstract class ApiConstants {
  static const String baseUrl =
      "https://unbordered-flutter-assignment.tech-c06.workers.dev";

  /// [GET] "{{baseUrl}}/account/balances"
  static const String accountBalance = "/account/balances";

  /// [POST] "{{baseUrl}}/orders"
  ///
  /// body:
  /// ```json
  /// {
  ///   "fundId": "global-index-fund",
  ///   "currency": "INR",
  ///   "amount": 5000.00,
  /// }
  /// ```
  ///
  /// Response:
  /// ```json
  /// {
  ///   "orderId": "ORD-10231",
  ///   "status": "PLACED",
  ///   "fundId": "global-index-fund",
  ///   "currency": "INR",
  ///   "amount": 5000.00,
  ///   "placedAt": "2026-11-14T10:30:00Z",
  /// }
  /// ```
  static const String placeOrder = "/orders";
}
