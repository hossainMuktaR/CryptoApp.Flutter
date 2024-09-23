import 'package:cryptoapp_flutter/domain/model/Coin.dart';
import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoins();

  Future<CoinDetail> getCoinById(String id);
}
