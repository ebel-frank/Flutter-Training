import 'journal.dart';

class Database {
  List<Journal> journal;

  Database({required this.journal});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
      journal:
          List<Journal>.from(json["journals"].map((e) => Journal.fromJson(e))));

  Map<String, dynamic> toJson() =>
      {"journals": List<dynamic>.from(journal.map((e) => e.toJson()))};
}
