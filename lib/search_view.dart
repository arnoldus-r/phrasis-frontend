import 'package:flutter/material.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: phPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: phPrimary,
        title: const Text('Busqueda'),
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: MediaQuery.of(context).size.width,
                height: 650.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(34.0),
                    bottom: Radius.circular(0.0),
                  ),
                  color: phSecondary,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 15.0),
                            padding: EdgeInsets.only(
                                top: 10, left: 7, right: 3, bottom: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Buscar publicación',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: IconButton(
                            iconSize: 40,
                            icon: const Icon(Icons.search_rounded),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
