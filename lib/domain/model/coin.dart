class Coin {
  final String id;
  final bool isActive;
  final String name;
  final int rank;
  final String symbol;

  Coin({
    required this.id,
    required this.isActive,
    required this.name,
    required this.rank,
    required this.symbol,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'] as String,
      isActive: json['is_active'] as bool,
      name: json['name'] as String,
      rank: json['rank'] as int,
      symbol: json['symbol'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_active': isActive,
      'name': name,
      'rank': rank,
      'symbol': symbol,
    };
  }
}
