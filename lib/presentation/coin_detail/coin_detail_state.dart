import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';

class CoinDetailState {
  final CoinDetail? coin;
  final String error;
  final bool isLoading;

  CoinDetailState(
      {this.coin , this.error = '', this.isLoading = true});
}
