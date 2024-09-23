import 'package:cryptoapp_flutter/domain/model/Coin.dart';
import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';

abstract class CoinPaprikaApi {
  Future<List<Coin>> getCoins();
  Future<CoinDetail> getCoinById(String id);
}
