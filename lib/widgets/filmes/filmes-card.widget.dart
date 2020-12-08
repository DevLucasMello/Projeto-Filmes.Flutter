import 'package:filmes/class/filmes.dart';
import 'package:flutter/material.dart';
import 'package:filmes/pages/detalhes.page.dart';

class FilmeCard extends StatelessWidget {
  final Filmes filme;
  final String image;
  final String title;
  final String dataLancamento;

  FilmeCard({
    @required this.filme,
    @required this.image,
    @required this.title,
    @required this.dataLancamento,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: 170,
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilmePage(
                    filme: filme,
                  ),
                ),
              );
            },
            child: Hero(
              tag: image,
              child: Image.network(
                image,
                width: 170,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 20,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            dataLancamento,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
