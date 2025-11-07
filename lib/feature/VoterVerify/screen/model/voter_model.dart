class VoterModel {
  final String nid;
  final String name;
  final String bDate;
  final bool hasVoted;

  VoterModel({
    required this.nid,
    required this.name,
    required this.bDate,
    required this.hasVoted,
  });

  factory VoterModel.fromJson(Map<String, dynamic> json) {
    return VoterModel(
      nid: json['nid'],
      name: json['name'],
      bDate: json['bDate'],
      hasVoted: json['hasVoted'],
    );
  }
}
