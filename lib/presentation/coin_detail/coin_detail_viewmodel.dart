import 'package:cryptoapp_flutter/data/repository/coin_repository_impl.dart';
import 'package:cryptoapp_flutter/domain/repository/coin_repository.dart';
import 'package:cryptoapp_flutter/presentation/coin_detail/coin_detail_state.dart';
import 'package:flutter/material.dart';

class CoinDetailViewmodel extends ChangeNotifier {
  final CoinRepository repo;
  final String coinid;

  CoinDetailState _state = CoinDetailState();
  CoinDetailState get state => _state;

  CoinDetailViewmodel({required this.coinid, CoinRepository? repo})
      : repo = repo ?? CoinRepositoryImpl() {
    getCoin(coinid);
  }

  void getCoin(String id) async {
    _state = CoinDetailState(isLoading: true);
    notifyListeners();

    final result = await repo.getCoinById(id);
    _state = CoinDetailState(coin: result, isLoading: false);
    notifyListeners();
  }
}
