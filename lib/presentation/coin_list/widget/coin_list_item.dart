import 'package:cryptoapp_flutter/domain/model/Coin.dart';
import 'package:flutter/material.dart';

class CoinlistItem extends StatelessWidget {
  final Coin coin;
  final Function(Coin) onItemClick;
  const CoinlistItem(
      {super.key, required this.coin, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onItemClick(coin),
      title: Text(
        '${coin.rank}. ${coin.name} (${coin.symbol})',
        style: Theme.of(context).textTheme.titleLarge,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        coin.isActive ? 'active' : 'inActive',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: coin.isActive ? Colors.green : Colors.red),
        textAlign: TextAlign.end,
      ),
    );
  }
}
