import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'database.dart';

class DatabaseFileRoutines {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File("$path/local_persistence.json");
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;

      if (!file.existsSync()) {
        log("File does not exist: ${file.absolute}");
        await writeJournals('{"journals":[]}');
      }

      // Read the file
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      log("error readJournals: $e");
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(json);
  }
}

Database databaseFromJson(String jsonString) {
  final dataFromJson = json.decode(jsonString);
  return Database.fromJson(dataFromJson);
}

String databaseToJson(Database data) {
  final dataToJson = data.toJson();
  return json.encode(dataToJson);
}
