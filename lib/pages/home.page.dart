import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:filmes/class/filmes.dart';
import 'package:filmes/widgets/filmes/filmes-list.widget.dart';
import 'package:filmes/widgets/busca-box.widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var filmes = new List<Filmes>();
  List data;
  Future<List> getJSONData() async {
    final String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=b6b5d3e16d434bbb9db8d0b69b8b35c5&sort_by=popularity.desc&language=pt-BR";

    var response = await http.get(url);
    setState(() {
      data = json.decode(response.body)['results'];
      filmes = data.map((model) => Filmes.fromJson(model)).toList();
    });

    return filmes;
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            SearchBox(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TOP 7",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: Future.delayed(Duration(seconds: 1)),
              builder: (c, s) => s.connectionState == ConnectionState.done
                  ? Container(
                      height: 345,
                      child: FilmesList(
                        scrollDirection: Axis.horizontal,
                        listaFilmes: filmes,
                      ),
                    )
                  : Text(
                      "Loading...",
                      style: Theme.of(context).textTheme.headline3,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getJSONData();
  }
}
