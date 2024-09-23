import 'dart:convert';
import 'package:cryptoapp_flutter/common/coin_paprika_routes.dart';
import 'package:cryptoapp_flutter/data/remote/coin_paprika_api.dart';
import 'package:cryptoapp_flutter/domain/model/Coin.dart';
import 'package:cryptoapp_flutter/domain/model/coin_detail.dart';
import 'package:http/http.dart' as http;

class CoinPaprikaApiImpl implements CoinPaprikaApi {
  final http.Client client;

  CoinPaprikaApiImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<Coin>> getCoins() async {
    try {
      final response = await client.get(Uri.parse(CoinPaprikaRoutes.getCoins));

      if (response.statusCode == 200) {
        final List<dynamic> json = jsonDecode(response.body);
        return json.map((item) => Coin.fromJson(item)).toList().sublist(0, 100);
      } else {
        throw Exception('Failed to load coin');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load coin');
    }
  }

  @override
  Future<CoinDetail> getCoinById(String id) async {
    try {
      final response =
          await client.get(Uri.parse('${CoinPaprikaRoutes.getCoins}/$id'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return CoinDetail.fromJson(json);
      } else {
        throw Exception("failed to load $id");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("failed to load $id");
    }
  }
}
