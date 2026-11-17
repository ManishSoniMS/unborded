import 'package:unbordered/src/core/error/failure.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/features/home/domain/entities/order_response/order_response_entity.dart';

const orderJson = <String, dynamic>{
  'orderId': 'ORD-10231',
  'status': 'PLACED',
  'fundId': 'global-index-fund',
  'currency': 'INR',
  'amount': 5000.00,
  'placedAt': '2026-11-14T10:30:00Z',
};

final orderResponse = OrderResponseEntity(
  orderId: 'ORD-10231',
  status: 'PLACED',
  fundId: 'global-index-fund',
  currency: Currency.INR,
  amount: 5000,
  placedAt: DateTime.utc(2026, 11, 14, 10, 30),
);

final serverFailure = Failure(
  code: FailureCodes.server,
  message: 'Server down',
  object: null,
);
