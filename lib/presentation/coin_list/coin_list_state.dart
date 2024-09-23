import 'package:cryptoapp_flutter/domain/model/Coin.dart';

class CoinListState {
  final List<Coin> coins;
  final String error;
  final bool isLoading;

  CoinListState({this.coins = const [], this.error = '', this.isLoading = false});
}