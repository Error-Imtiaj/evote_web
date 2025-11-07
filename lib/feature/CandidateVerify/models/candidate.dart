class Candidate {
  final int id;
  final String name;
  final String party;

  Candidate({required this.id, required this.name, required this.party});

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(id: json['id'], name: json['name'], party: json['party']);
  }
}
