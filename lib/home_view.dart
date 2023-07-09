import 'package:flutter/material.dart';
import 'package:phrasis_frontend/profile_view.dart';
import 'package:phrasis_frontend/search_view.dart';
import 'package:phrasis_frontend/publication_view.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/post.dart';
import 'package:phrasis_frontend/fav_view.dart';
import 'dart:io';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Iniciar sesión';
const String loginLabelText = 'Entrar';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';

const String ph1 = "La política es el arte de buscar problemas, encontrarlos, realizar un diagnóstico falso y aplicar después remedios equivocados";
const String ph2 = "Un amigo de todos es una amigo de nadie";
const String ph3 = "Vive como si fueras a morir mañana; aprende como si el mundo fuera a durar para siempre";
const String ph4 = "La mayor declaración de amor es la que no se hace; el hombre que siente mucho, habla poco";
const String ph5 = "La inspiración existe, pero tiene que encontrarte trabajando";
const String ph6 = "El único hombre que no se equivoca es el que nunca hace nada";
const String ph7 = "La mejor manera de librarse de la tentación es caer en ella";
const String ph8 = "El éxito tiene muchos padres, pero el fracaso es huérfano";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: phSecondary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.edit,
              color: phSecondary,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Publication()
                  ),
                );
              },// => Navigator.pop(context),
          ),
          ),
        endDrawer: Drawer(
          child: ListView(
            children: [
            const DrawerHeader(
            decoration: BoxDecoration(
              color: phPrimary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: phSecondary),
            ),
          ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: const Text('Frasear'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Publication()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text('Buscar'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_rounded),
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Favorite()
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Salir'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),

            ],
          ),

        ),
        body: //CustomScrollView(
          //slivers: [
           // SliverFillRemaining(
              //hasScrollBody: false,
              //child: 
              SafeArea(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                //padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Center(
                    child:  _form(),
                  ),
                ),
              ),
            ),
          //],
        //),
      //),
    );

  }

  Widget _form() {
    return //Form(
      //key: _formKey,
      //child: 
      ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const SizedBox(height: 55),
          //_title(),
          //const SizedBox(height: 34),
          //EmailField(controller: emailController),
          //const SizedBox(height: 21),
          //PasswordField(controller: passwordController),
          //const SizedBox(height: 21),
          const SizedBox(height: 8),
          _publi(ph1, "people.jpg"),
          const SizedBox(height: 8),
          _publi(ph2, ""),
          const SizedBox(height: 8),
          _publi(ph3, "nature.jpg"),
          const SizedBox(height: 8),
          _publi(ph4, "city.jpg"),
          const SizedBox(height: 8),
          _publi(ph5, "employer.jpg"),
          const SizedBox(height: 8),
          _publi(ph6, ""),
          const SizedBox(height: 8),
          _publi(ph7, "bar.jpg"),
          const SizedBox(height: 8),
          _publi(ph8, "money.jpg"),
          const SizedBox(height: 8),
          //_LoginButton(),
          //_SignUp(),
        ],
      //),
    );

  }

  Widget _publi(String phrase, String imageName) {
    return Post(
            isPost: true,
            username: 'juan.perez',
            content: phrase,
            backgroundImage: 'assets/images/${imageName}',
          );
  }

  Widget _title() {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

/*
  Widget _LoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                email: emailController.text,
              )
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill nput')
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: const Text(
          loginLabelText,
          textAlign: TextAlign.center,
        ),
      ),
    );

  }

  Widget _SignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(haveUser),
        TextButton(
          child: const Text(
            signUpLabelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp()
              ),
            );
          },
        ),
      ],
    );
  }
*/
}
