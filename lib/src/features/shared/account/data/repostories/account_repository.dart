import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/type_defs.dart';
import '../../../../../core/error/map_exception_to_failure.dart';
import '../../domain/entities/account_balance/account_balance_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../sources/account_source.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  new(this._source);

  final AccountSource _source;

  @override
  FailureOr<AccountBalanceEntity> fetchAccountBalance() async {
    try {
      final result = await _source.fetchAccountBalance();
      return Right(result);
    } catch (e) {
      return Left(mapError(e));
    }
  }
}
