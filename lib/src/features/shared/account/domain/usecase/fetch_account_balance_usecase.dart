import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/base/usecase.dart';
import '../entities/account_balance/account_balance_entity.dart';
import '../repositories/account_repository.dart';

@lazySingleton
class FetchAccountBalanceUsecase
    extends IUseCase<AccountBalanceEntity, NoParams> {
  new(this._repository);

  final AccountRepository _repository;

  @override
  FailureOr<AccountBalanceEntity> call(NoParams param) async {
    return await _repository.fetchAccountBalance();
  }
}
