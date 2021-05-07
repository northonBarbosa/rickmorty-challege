import 'package:flutter_rickmorty/model/episode_fields.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EpisodesDatabase {
  static final EpisodesDatabase instance = EpisodesDatabase._init();

  static Database _database;

  EpisodesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('episodes.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("ALTER TABLE $tableEpisodes ALTER COLUMN favorite TEXT");
    }
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT';

    await db.execute('''
      CREATE TABLE $tableEpisodes(
        ${EpisodeFields.id} $idType,
        ${EpisodeFields.episodeId} $textType,
        ${EpisodeFields.title} $textType,
        ${EpisodeFields.episodeNumber} $textType,
        ${EpisodeFields.airDate} $textType,
        ${EpisodeFields.characters} $textType,
        ${EpisodeFields.favorite} $boolType,
        ${EpisodeFields.watched} $boolType
      )
    ''');
  }

  Future<Episode> create(Episode episode) async {
    final db = await instance.database;

    final id = await db.insert(tableEpisodes, episode.toJson());
    return episode.copy(id: id);
  }

  Future<Episode> readEpisode(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableEpisodes,
      columns: EpisodeFields.values,
      where: '${EpisodeFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Episode.fromJson(maps.first);
    } else {
      throw Exception('ID $id não encontrado');
    }
  }

  Future<List<Episode>> readAllFavoritesEpisodes() async {
    final db = await instance.database;

    final orderBy = '${EpisodeFields.id} ASC';
    final result = await db.query(
      tableEpisodes,
      orderBy: orderBy,
    );

    return result.map((json) => Episode.fromJson(json)).toList();
  }

  Future<int> update(Episode episode) async {
    final db = await instance.database;

    return db.update(
      tableEpisodes,
      episode.toJson(),
      where: '${EpisodeFields.id} = ?',
      whereArgs: [episode.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableEpisodes,
      where: '${EpisodeFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
