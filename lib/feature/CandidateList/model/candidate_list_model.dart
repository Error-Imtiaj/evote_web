class CandidateListModel {
  final int id;
  final String name;
  final String party;
  final int voteCount;

  CandidateListModel({
    required this.id,
    required this.name,
    required this.party,
    required this.voteCount,
  });

  factory CandidateListModel.fromJson(Map<String, dynamic> json) {
    return CandidateListModel(
      id: json['id'],
      name: json['name'],
      party: json['party'],
      voteCount: json['vote_count'],
    );
  }
}
