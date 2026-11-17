import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../routes/app_routes.dart';
import '../../../shared/account/presentation/blocs/account/account_cubit.dart';

class Stock {
  new(this.id, this.name);

  final String id;
  final String name;
}

List<Stock> stocks = [
  Stock("global-index-fund", "Global Index Fund"),
  Stock("indian-index-fund", "Indian Index Fund"),
  Stock("american-index-fund", "American Index Fund"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Most Traded Stocks")),
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, accountState) {
          if (accountState.status == BlocStatus.failure) {
            return AppErrorWidget(
              onRetry: () {
                context.read<AccountCubit>().fetch();
              },
              failure: accountState.failure!,
            );
          }
          return AppLoader(
            isLoading: accountState.status == BlocStatus.loading,
            child: CustomScrollView(
              slivers: [
                if (accountState.status == BlocStatus.loaded)
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.lightGreenAccent,
                      child: Row(
                        children: [
                          Expanded(child: Center(child: Text("USD"))),
                          Expanded(
                            child: Center(
                              child: Text(
                                "${Currency.USD.sign}${accountState.usd.toAmount}",
                              ),
                            ),
                          ),
                          Expanded(child: Center(child: Text("INR"))),
                          Expanded(
                            child: Center(
                              child: Text(
                                "${Currency.INR.sign}${accountState.inr.toAmount}",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                SliverList(
                  delegate: SliverChildListDelegate([
                    for (int i = 0; i < stocks.length; i++)
                      ListTile(
                        onTap: () =>
                            context.push(AppRoutes.invest(stocks[i].id)),
                        leading: Text("#${i + 1}"),
                        title: Text(stocks[i].name),
                      ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
