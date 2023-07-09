import 'package:flutter/material.dart';
import 'package:phrasis_frontend/edit_profile_view.dart';
import 'package:phrasis_frontend/edit_profile_view.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: phPrimary,
      appBar: AppBar(
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => EditProfile())));
                              },
                              child: Text("Actualizar")),
                        ],
                      ),
                      Text(
                        "Información del Usuario",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nombre:",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        alignment: Alignment.centerLeft,
                        child: Text("Descripcion:", textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        alignment: Alignment.centerLeft,
                        child: Text("Correo:", textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0, top: 10.0),
                        padding: EdgeInsets.only(left: 10.0, top: 2.0),
                        alignment: Alignment.centerLeft,
                        child: Text("Idioma:", textAlign: TextAlign.left),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
