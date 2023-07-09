import 'package:flutter/material.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: phPrimary,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              //color: phPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        elevation: 0,
        backgroundColor: phPrimary,
        title: const Text('Perfil'),
      ),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional(0, 1),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                width: 130.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/219/219969.png"),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 540.0,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "@usuario",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Guardar")),
                      ],
                    ),
                    Text(
                      "Información del Usuario",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                                padding: EdgeInsets.only(left: 10.0, top: 5.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nombre:",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                                alignment: Alignment.centerLeft,
                                child: Text("Descripcion:",
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                                alignment: Alignment.centerLeft,
                                child:
                                    Text("Correo:", textAlign: TextAlign.left),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                                alignment: Alignment.centerLeft,
                                child:
                                    Text("Idioma:", textAlign: TextAlign.left),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 42.5,
                                padding: EdgeInsets.only(
                                    top: 4, left: 2, right: 3, bottom: 2),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42.5,
                                padding: EdgeInsets.only(
                                    top: 2, left: 2, right: 3, bottom: 2),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42.5,
                                padding: EdgeInsets.only(
                                    top: 2, left: 2, right: 3, bottom: 2),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42.5,
                                padding: EdgeInsets.only(
                                    top: 2, left: 2, right: 3, bottom: 2),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
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
