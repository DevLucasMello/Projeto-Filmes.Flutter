class Filmes {
  String backdropPath;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;

  Filmes({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  Filmes.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    backdropPath = json['backdrop_path'] == null
        ? "https://higipratic.com.br/site/wp-content/uploads/2017/12/indisponivel.jpg"
        : "https://image.tmdb.org/t/p/w185_and_h278_bestv2" +
            json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'] == null
        ? "Não Informado"
        : json['original_language'];
    originalTitle = json['original_title'] == null
        ? "Não Informado"
        : json['original_title'];
    overview = json['overview'] == "" ? "Não Informado" : json['overview'];
    posterPath = json['poster_path'] == null
        ? "https://higipratic.com.br/site/wp-content/uploads/2017/12/indisponivel.jpg"
        : "https://image.tmdb.org/t/p/w185_and_h278_bestv2" +
            json['poster_path'];
    releaseDate =
        json['release_date'] == null ? "Não Informado" : json['release_date'];
    title = json['title'] == null ? "Não Informado" : json['title'];
  }
}
