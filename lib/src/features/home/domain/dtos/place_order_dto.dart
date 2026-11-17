import '../../../../core/utils/enums/enums.dart';

class PlaceOrderDto {
  new({required this.fundId, required this.currency, required this.amount});

  final String fundId;
  final Currency currency;
  final double amount;

  Map<String, dynamic> toMap() {
    return {"fundId": fundId, "currency": currency.name, "amount": amount};
  }
}
