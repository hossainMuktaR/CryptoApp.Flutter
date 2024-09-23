import 'package:cryptoapp_flutter/data/repository/coin_repository_impl.dart';
import 'package:cryptoapp_flutter/domain/repository/coin_repository.dart';
import 'package:cryptoapp_flutter/presentation/coin_list/coin_list_state.dart';
import 'package:flutter/material.dart';

class CoinListViewModel extends ChangeNotifier {
  final CoinRepository repo;

  CoinListState _state = CoinListState();
  CoinListState get state => _state;

  CoinListViewModel({CoinRepository? repo}): repo = repo ?? CoinRepositoryImpl() {
    getCoins();
  }

  void getCoins() async {
    // Show loading state
    _state = CoinListState(isLoading: true);
    notifyListeners();

    final result = await repo.getCoins();
    _state = CoinListState(coins: result, isLoading: false);
    notifyListeners();
  }
}
