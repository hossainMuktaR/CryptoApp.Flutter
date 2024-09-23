import 'package:cryptoapp_flutter/data/remote/coin_paprika_api.dart';
import 'package:cryptoapp_flutter/data/remote/coin_paprika_api_impl.dart';
import 'package:cryptoapp_flutter/domain/model/Coin.dart';
import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';
import 'package:cryptoapp_flutter/domain/repository/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinPaprikaApi api;

  CoinRepositoryImpl({CoinPaprikaApi? api}) : api = api ?? CoinPaprikaApiImpl();

  @override
  Future<List<Coin>> getCoins() async {
    return await api.getCoins();
  }

  @override
  Future<CoinDetail> getCoinById(String id) async {
    return await api.getCoinById(id);
  }
}
