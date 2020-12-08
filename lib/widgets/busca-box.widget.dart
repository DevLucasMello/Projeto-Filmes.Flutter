import 'package:filmes/pages/filme.page.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String parametro;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(128),
        ),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Center(
            child: Container(
              width: 210,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
                onChanged: (buscaUsuario) {
                  if (buscaUsuario.isEmpty) {
                  } else {
                    parametro = buscaUsuario.replaceAll(" ", "+");
                  }
                },
              ),
            ),
          ),
          FlatButton(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              height: 60,
              width: 107,
              child: Text(
                "BUSCAR",
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(128),
                ),
              ),
            ),
            onPressed: () {
              if (parametro.isEmpty) {
                Text("Não Informado");
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EscolhaPage(parametro),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
