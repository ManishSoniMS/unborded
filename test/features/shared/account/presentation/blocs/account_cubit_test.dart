import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';
import 'package:unbordered/src/features/shared/account/domain/usecase/fetch_account_balance_usecase.dart';
import 'package:unbordered/src/features/shared/account/presentation/blocs/account/account_cubit.dart';

class MockFetchBalance extends Mock implements FetchAccountBalanceUsecase {}

void main() {
  // Money logic: an order must debit only the wallet it was placed in.
  blocTest<AccountCubit, AccountState>(
    'update deducts only the matching currency',
    build: () => AccountCubit(fetchAccountBalance: MockFetchBalance()),
    seed: () => const AccountState(inr: 10000, usd: 50),
    act: (c) => c.update(Currency.INR, 4000),
    expect: () => [const AccountState(inr: 6000, usd: 50)],
  );
}
