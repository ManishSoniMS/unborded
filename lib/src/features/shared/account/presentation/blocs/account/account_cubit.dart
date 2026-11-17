import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/base/usecase.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../domain/usecase/fetch_account_balance_usecase.dart';

part "account_state.dart";

@injectable
class AccountCubit extends Cubit<AccountState> {
  AccountCubit({required this._fetchAccountBalance}) : super(AccountState());

  final FetchAccountBalanceUsecase _fetchAccountBalance;

  Future<void> fetch() async {
    emit(state.copyWith(status: BlocStatus.loading));
    final result = await _fetchAccountBalance.call(NoParams());
    result.fold(
      (l) => emit(state.copyWith(status: BlocStatus.failure, failure: l)),
      (r) => emit(
        state.copyWith(status: BlocStatus.loaded, inr: r.inr, usd: r.usd),
      ),
    );
  }

  Future<void> update(Currency currency, double amount) async {
    emit(
      state.copyWith(
        inr: currency == Currency.INR ? state.inr - amount : state.inr,
        usd: currency == Currency.USD ? state.usd - amount : state.usd,
      ),
    );
  }
}
