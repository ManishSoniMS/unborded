// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../external/register_module.dart' as _i1003;
import '../../features/home/data/repositories/order_repository.dart' as _i606;
import '../../features/home/data/sources/order_source.dart' as _i246;
import '../../features/home/domain/repositories/order_repository.dart' as _i667;
import '../../features/home/domain/usecases/place_order_usecase.dart' as _i1017;
import '../../features/home/presentation/blocs/invest/investment/investment_cubit.dart'
    as _i370;
import '../../features/shared/account/data/repostories/account_repository.dart'
    as _i993;
import '../../features/shared/account/data/sources/account_source.dart'
    as _i1059;
import '../../features/shared/account/domain/repositories/account_repository.dart'
    as _i766;
import '../../features/shared/account/domain/usecase/fetch_account_balance_usecase.dart'
    as _i86;
import '../../features/shared/account/presentation/blocs/account/account_cubit.dart'
    as _i619;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i1059.AccountSource>(
      () => _i1059.AccountSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i766.AccountRepository>(
      () => _i993.AccountRepositoryImpl(gh<_i1059.AccountSource>()),
    );
    gh.lazySingleton<_i246.OrderSource>(
      () => _i246.OrderSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i86.FetchAccountBalanceUsecase>(
      () => _i86.FetchAccountBalanceUsecase(gh<_i766.AccountRepository>()),
    );
    gh.factory<_i619.AccountCubit>(
      () => _i619.AccountCubit(
        fetchAccountBalance: gh<_i86.FetchAccountBalanceUsecase>(),
      ),
    );
    gh.lazySingleton<_i667.OrderRepository>(
      () => _i606.OrderRepositoryImpl(gh<_i246.OrderSource>()),
    );
    gh.lazySingleton<_i1017.PlaceOrderUsecase>(
      () => _i1017.PlaceOrderUsecase(gh<_i667.OrderRepository>()),
    );
    gh.factory<_i370.InvestmentCubit>(
      () => _i370.InvestmentCubit(placeOrder: gh<_i1017.PlaceOrderUsecase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i1003.RegisterModule {}
