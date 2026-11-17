part of 'investment_cubit.dart';

class InvestmentState extends Equatable {
  const InvestmentState({
    this.status = BlocStatus.initial,
    this.fundId = "",
    this.amount = 0,
    this.currency = Currency.INR,
    this.failure,
    this.orderResponse,
  });

  final BlocStatus status;
  final String fundId;
  final double amount;
  final Currency currency;
  final Failure? failure;
  final OrderResponseEntity? orderResponse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvestmentState &&
          runtimeType == other.runtimeType &&
          fundId == other.fundId &&
          status == other.status &&
          amount == other.amount &&
          currency == other.currency &&
          failure == other.failure &&
          orderResponse == other.orderResponse);

  @override
  int get hashCode =>
      status.hashCode ^
      fundId.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      failure.hashCode ^
      orderResponse.hashCode;

  @override
  String toString() =>
      'InvestmentState{status: $status, fundId: $fundId, amount: $amount, '
      'currency: $currency, failure: $failure, orderResponse: $orderResponse}';

  InvestmentState copyWith({
    BlocStatus? status,
    String? fundId,
    double? amount,
    Currency? currency,
    Failure? failure,
    OrderResponseEntity? orderResponse,
  }) {
    return InvestmentState(
      status: status ?? this.status,
      fundId: fundId ?? this.fundId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      failure: failure ?? this.failure,
      orderResponse: orderResponse ?? this.orderResponse,
    );
  }

  @override
  List<Object?> get props => [
    status,
    fundId,
    amount,
    currency,
    failure,
    orderResponse,
  ];
}
