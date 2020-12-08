import 'dart:convert';
import 'package:filmes/class/filmes.dart';
import 'package:filmes/pages/detalhes.page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EscolhaPage extends StatefulWidget {
  final String dado;

  const EscolhaPage(this.dado);
  @override
  _EscolhaPageState createState() => _EscolhaPageState();
}

class _EscolhaPageState extends State<EscolhaPage> {
  var busca = new List<Filmes>();
  List data;

  Future<String> getJSONData2() async {
    final String url =
        "https://api.themoviedb.org/3/search/movie?api_key=b6b5d3e16d434bbb9db8d0b69b8b35c5&query=" +
            widget.dado +
            "&language=pt-BR";

    var response = await http.get(url);
    setState(() {
      data = json.decode(response.body)['results'];
      busca = data.map((model) => Filmes.fromJson(model)).toList();
    });

    return "busca";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lucas Filmes",
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _listView(),
    );
  }

  _listView() {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        itemCount: busca == null ? 0 : busca.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            width: 170,
            color: Theme.of(context).backgroundColor,
            child: Row(
              children: <Widget>[
                FlatButton(
                    child: GestureDetector(
                      child: Hero(
                        tag: "Foto" + busca[index].id.toString(),
                        child: busca[index].posterPath ==
                                "https://higipratic.com.br/site/wp-content/uploads/2017/12/indisponivel.jpg"
                            ? Image.network(
                                busca[index].backdropPath,
                                width: 60,
                                height: 80,
                                fit: BoxFit.fitWidth,
                              )
                            : Image.network(
                                busca[index].posterPath,
                                width: 60,
                                height: 80,
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilmePage(
                            filme: busca[index],
                          ),
                        ),
                      );
                    }),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 3, top: 5, bottom: 5),
                      child: Text(
                        busca[index].title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      height: 30,
                      alignment: Alignment.centerRight,
                      child: Text(
                        busca[index].releaseDate,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getJSONData2();
  }
}
