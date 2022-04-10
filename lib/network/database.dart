import 'dart:io';
import "package:drift/drift.dart";
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name').nullable()();
  TextColumn get email => text().named('email').nullable()();
  TextColumn get address => text().named('address').nullable()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Profiles])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Profile>> getProfileData() => select(profiles).watch();

  Future insertProfile(ProfilesCompanion profile) =>
      into(profiles).insert(profile);

  Future updateProfile(Profile profile) => update(profiles).replace(profile);
}
