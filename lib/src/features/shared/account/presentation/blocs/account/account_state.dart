part of "account_cubit.dart";

class AccountState extends Equatable {
  const AccountState({
    this.inr = 0,
    this.usd = 0,
    this.status = BlocStatus.initial,
    this.failure,
  });

  final double inr;
  final double usd;
  final BlocStatus status;
  final Failure? failure;

  AccountState copyWith({
    double? inr,
    double? usd,
    BlocStatus? status,
    Failure? failure,
  }) {
    return AccountState(
      inr: inr ?? this.inr,
      usd: usd ?? this.usd,
      status: status ?? this.status,
      failure: failure,
    );
  }

  double balance(Currency currency) {
    switch (currency) {
      case Currency.USD:
        return usd;
      default:
        return inr;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountState &&
          runtimeType == other.runtimeType &&
          inr == other.inr &&
          usd == other.usd &&
          status == other.status &&
          failure == other.failure);

  @override
  int get hashCode =>
      inr.hashCode ^ usd.hashCode ^ status.hashCode ^ failure.hashCode;

  @override
  String toString() =>
      'AccountState{inr: $inr, usd: $usd, '
      'status: $status, failure: $failure}';

  @override
  List<Object?> get props => [inr, usd, status, failure];
}
