final String tableEpisodes = 'episodes';

class EpisodeFields {
  static final List<String> values = [
    id,
    episodeId,
    title,
    episodeNumber,
    airDate,
    characters,
    favorite,
    watched
  ];

  static final String id = '_id';
  static final String episodeId = 'episode_id';
  static final String title = 'title';
  static final String episodeNumber = 'episode_number';
  static final String airDate = 'air_date';
  static final String characters = 'characters';
  static final String favorite = 'favorite';
  static final String watched = 'watched';
}

class Episode {
  const Episode({
    this.id,
    this.episodeId,
    this.title,
    this.episodeNumber,
    this.airDate,
    this.characters,
    this.favorite,
    this.watched,
  });

  final int id;
  final String episodeId;
  final String title;
  final String episodeNumber;
  final String airDate;
  final String characters;
  final bool favorite;
  final bool watched;

  Episode copy({
    int id,
    String episodeId,
    String title,
    String episodeNumber,
    String airDate,
    String characters,
    bool favorite,
    bool watched,
  }) =>
      Episode(
        id: id ?? this.id,
        episodeId: episodeId ?? this.episodeId,
        title: title ?? this.title,
        episodeNumber: episodeNumber ?? this.episodeNumber,
        airDate: airDate ?? this.airDate,
        characters: characters ?? this.characters,
        favorite: favorite ?? this.favorite,
        watched: watched ?? this.watched,
      );

  static Episode fromJson(Map<String, Object> json) => Episode(
    id: json[EpisodeFields.id] as int,
    episodeId: json[EpisodeFields.episodeId] as String,
    title: json[EpisodeFields.title] as String,
    episodeNumber: json[EpisodeFields.episodeNumber] as String,
    airDate: json[EpisodeFields.airDate] as String,
    characters: json[EpisodeFields.characters] as String,
    favorite: json[EpisodeFields.favorite] == 1,
    watched: json[EpisodeFields.watched] == 1,
  );

  Map<String, Object> toJson() => {
        EpisodeFields.id: id,
        EpisodeFields.episodeId: episodeId,
        EpisodeFields.title: title,
        EpisodeFields.episodeNumber: episodeNumber,
        EpisodeFields.airDate: airDate,
        EpisodeFields.characters: characters,
        EpisodeFields.favorite: favorite ? 1 : 0,
        EpisodeFields.watched: watched ? 1 : 0,
      };
}
