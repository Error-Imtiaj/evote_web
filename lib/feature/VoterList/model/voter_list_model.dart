class VoterListModel {
  final int id;
  final String nid;
  final String name;
  final String birthDate;
  final bool hasVoted;

  VoterListModel({
    required this.id,
    required this.nid,
    required this.name,
    required this.birthDate,
    required this.hasVoted,
  });

  factory VoterListModel.fromJson(Map<String, dynamic> json) {
    return VoterListModel(
      id: json['id'],
      nid: json['nid'] ?? '',
      name: json['name'] ?? '',
      birthDate: json['birth_date'] ?? '',
      hasVoted: json['has_voted'] ?? false,
    );
  }
}
