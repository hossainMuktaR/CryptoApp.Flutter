class CoinDetail {
  final String coinId;
  final String name;
  final String description;
  final String symbol;
  final int rank;
  final bool isActive;
  final List<String> tags;
  final List<TeamMember> team;

  CoinDetail({
    required this.coinId,
    required this.name,
    required this.description,
    required this.symbol,
    required this.rank,
    required this.isActive,
    required this.tags,
    required this.team,
  });

  factory CoinDetail.fromJson(Map<String, dynamic> json) {
    return CoinDetail(
      coinId: json['id'],
      name: json['name'],
      description: json['description'],
      symbol: json['symbol'],
      rank: json['rank'],
      isActive: json['is_active'],
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])),
      team: List<TeamMember>.from(json['team'].map((member) => TeamMember.fromJson(member))),
    );
  }
}

class TeamMember {
  final String id;
  final String name;
  final String position;

  TeamMember({
    required this.id,
    required this.name,
    required this.position,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      id: json['id'],
      name: json['name'],
      position: json['position'],
    );
  }
}