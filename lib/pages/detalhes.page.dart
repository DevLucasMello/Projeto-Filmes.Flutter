import 'package:filmes/class/filmes.dart';
import 'package:flutter/material.dart';

class FilmePage extends StatelessWidget {
  final Filmes filme;
  FilmePage({
    @required this.filme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black.withOpacity(0.4),
              elevation: 0.0,
              expandedHeight: 600.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: "Foto",
                  child: filme.backdropPath ==
                          "https://higipratic.com.br/site/wp-content/uploads/2017/12/indisponivel.jpg"
                      ? Image.network(
                          filme.posterPath,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )
                      : Image.network(
                          filme.backdropPath,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                filme.title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(filme.releaseDate),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Sinopse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(filme.overview),
            ),
          ],
        ),
      ),
    );
  }
}
