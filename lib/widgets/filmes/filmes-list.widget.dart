import 'package:flutter/material.dart';
import 'package:filmes/class/filmes.dart';
import 'package:filmes/widgets/filmes/filmes-card.widget.dart';

class FilmesList extends StatelessWidget {
  final Axis scrollDirection;
  final List<Filmes> listaFilmes;

  FilmesList({
    @required this.scrollDirection,
    @required this.listaFilmes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          FilmeCard(
            image: listaFilmes[0].posterPath,
            title: listaFilmes[0].title,
            dataLancamento: listaFilmes[0].releaseDate,
            filme: listaFilmes[0],
          ),
          FilmeCard(
            image: listaFilmes[1].posterPath,
            title: listaFilmes[1].title,
            dataLancamento: listaFilmes[1].releaseDate,
            filme: listaFilmes[1],
          ),
          FilmeCard(
            image: listaFilmes[2].posterPath,
            title: listaFilmes[2].title,
            dataLancamento: listaFilmes[2].releaseDate,
            filme: listaFilmes[2],
          ),
          FilmeCard(
            image: listaFilmes[3].posterPath,
            title: listaFilmes[3].title,
            dataLancamento: listaFilmes[3].releaseDate,
            filme: listaFilmes[3],
          ),
          FilmeCard(
            image: listaFilmes[4].posterPath,
            title: listaFilmes[4].title,
            dataLancamento: listaFilmes[4].releaseDate,
            filme: listaFilmes[4],
          ),
          FilmeCard(
            image: listaFilmes[5].posterPath,
            title: listaFilmes[5].title,
            dataLancamento: listaFilmes[5].releaseDate,
            filme: listaFilmes[5],
          ),
          FilmeCard(
            image: listaFilmes[6].posterPath,
            title: listaFilmes[6].title,
            dataLancamento: listaFilmes[6].releaseDate,
            filme: listaFilmes[6],
          ),
        ],
      ),
    );
  }
}
