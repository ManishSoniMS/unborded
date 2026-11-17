import 'package:flutter_test/flutter_test.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/features/home/domain/entities/order_response/order_response_entity.dart';

import '../../../helpers/fixtures.dart';

void main() {
  test('OrderResponseEntity.fromJson parses the API payload', () {
    final e = OrderResponseEntity.fromJson(orderJson);

    expect(e.orderId, 'ORD-10231');
    expect(e.currency, Currency.INR);
    expect(e.amount, 5000.0);
    expect(e.placedAt, DateTime.utc(2026, 11, 14, 10, 30));
  });

  test('OrderResponseEntity.fromJson throws on missing field', () {
    final bad = Map<String, dynamic>.from(orderJson)..remove('orderId');
    expect(() => OrderResponseEntity.fromJson(bad), throwsA(anything));
  });
}
