import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../domain/entities/account_balance/account_balance_entity.dart';

abstract class AccountSource {
  Future<AccountBalanceEntity> fetchAccountBalance();
}

@LazySingleton(as: AccountSource)
class AccountSourceImpl implements AccountSource {
  new(this._dio);

  final Dio _dio;
  @override
  Future<AccountBalanceEntity> fetchAccountBalance() async {
    final result = await _dio.get(ApiConstants.accountBalance);

    return AccountBalanceEntity.fromJson(result.data as Map<String, dynamic>);
  }
}
