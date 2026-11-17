import '../../../../../core/base/type_defs.dart';
import '../entities/account_balance/account_balance_entity.dart';

abstract class AccountRepository {
  FailureOr<AccountBalanceEntity> fetchAccountBalance();
}
