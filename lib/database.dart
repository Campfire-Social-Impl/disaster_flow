import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

class FlowRaw extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get disaster => text()();
}

class ActionRaw extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get flowId => integer().references(FlowRaw, #id)();
  TextColumn get title => text()();
  TextColumn get action => text()();
  IntColumn get index => integer()();
}

class NotifyRaw extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get disaster => text()();
  TextColumn get description => text()();
  RealColumn get longitute => real()();
  RealColumn get latitude => real()();
  RealColumn get radius => real()();
  DateTimeColumn get time => dateTime()();
  BoolColumn get addressed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [FlowRaw, ActionRaw, NotifyRaw])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFloder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFloder.path, 'db.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

final database = LocalDatabase();
