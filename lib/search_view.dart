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
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: Text("Buscar"),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 550.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(34.0),
                    bottom: Radius.circular(0.0),
                  ),
                  color: phSecondary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Resultado"),
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
