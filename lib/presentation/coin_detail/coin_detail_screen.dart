import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';
import 'package:cryptoapp_flutter/presentation/coin_detail/coin_detail_state.dart';
import 'package:cryptoapp_flutter/presentation/coin_detail/coin_detail_viewmodel.dart';
import 'package:cryptoapp_flutter/presentation/coin_detail/widget/coin_tag.dart';
import 'package:cryptoapp_flutter/presentation/coin_detail/widget/team_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinDetailScreen extends StatelessWidget {
  final String coinId;

  const CoinDetailScreen({super.key, required this.coinId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CoinDetailViewmodel(coinid: coinId),
        child: Consumer<CoinDetailViewmodel>(
          builder: (context, viewModel, child) {
            final state = viewModel.state;
            // Render your coin detail UI here using state.coin
            return Scaffold(
              appBar: AppBar(
                title: Text(state.coin?.name ?? "Coin Name"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back), // Custom back icon
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
              ),
              body: _buildBody(context, state),
            );
          },
        ),
      );
  }

  Widget _buildBody(context, CoinDetailState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error.isNotEmpty) {
      return Center(child: Text(state.error));
    }

    if (state.coin == null) {
      return const Center(child: Text("No coin details found."));
    }

    return _buildCoinDetail(context, state.coin!);
  }

  Widget _buildCoinDetail(context, CoinDetail coin) {
    return Padding(

              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Coin Rank and Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text(
                            "${coin.rank}. ${coin.name} (${coin.symbol})",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            coin.isActive ? "active" : "inactive",
                            style: TextStyle(
                              color: coin.isActive ? Colors.green : Colors.red,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Coin Description
                    Text(
                      coin.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 15),
                    // Tags Section
                    Text(
                      "Tags",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          coin.tags.map((tag) => CoinTag(tag: tag)).toList(),
                    ),
                    const SizedBox(height: 15),
                    // Team Members Section
                    Text(
                      "Team members",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 15),
                    // Team Members List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: coin.team.length,
                      itemBuilder: (context, index) {
                        final teamMember = coin.team[index];
                        return TeamListItem(teamMember: teamMember);
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  ],
                ),
              ),
            );
  }
}
