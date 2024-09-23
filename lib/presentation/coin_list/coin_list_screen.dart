import 'package:cryptoapp_flutter/presentation/coin_detail/coin_detail_screen.dart';
import 'package:cryptoapp_flutter/presentation/coin_list/coin_list_viewmodel.dart';
import 'package:cryptoapp_flutter/presentation/coin_list/widget/coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => CoinListViewModel(),
        child: Consumer<CoinListViewModel>(
          builder: (context, vm, child) {
            final state = vm.state;
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error.isNotEmpty) {
              return Center(child: Text(state.error));
            }

            if (state.coins.isEmpty) {
              return const Center(child: Text("No coin details found."));
            }
            return Stack(children: [
              // Coin List
              ListView.builder(
                itemCount: state.coins.length,
                itemBuilder: (context, index) {
                  final coin = state.coins[index];
                  return CoinlistItem(coin: coin, onItemClick: (coin) {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CoinDetailScreen(coinId: coin.id))
                                  );
                  });
                },
              ),
            ]);
          },
        ),
      ),
    );
  }
}
