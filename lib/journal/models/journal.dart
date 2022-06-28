class Journal {
  String documentID, date;

  Journal({required this.documentID, required this.date});

  factory Journal.fromDoc(dynamic doc) =>
      Journal(documentID: doc.documentID, date: doc['date']);
  
}