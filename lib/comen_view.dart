import 'package:flutter/material.dart';
import 'package:phrasis_frontend/profile_view.dart';
import 'package:phrasis_frontend/search_view.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/post.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';
import 'package:phrasis_frontend/widget/area_field.dart';


const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Iniciar sesión';
const String loginLabelText = 'Entrar';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';

const String ph1 = "Esto es un comentario";

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _Comment();
}

class _Comment extends State<Comment> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: phSecondary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              //color: phPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Comentarios'),
          ),
        /*endDrawer: Drawer(
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: const Text('Buscar'),
              onTap: () {
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Salir'),
              onTap: () {},
            ),

            ],
          ),*/

        //),
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
          const SizedBox(height: 21),
          AreaField(controller: userController, lb: 'Comentario'),
          const SizedBox(height: 13),
          _FinishButton(),
          Divider(),
          const SizedBox(height: 8),
          _publi(ph1, ""),
          const SizedBox(height: 8),
          _publi(ph1, ""),
          const SizedBox(height: 8),
          _publi(ph1, ""),
          const SizedBox(height: 8),
          _publi(ph1, ""),
          const SizedBox(height: 8),
          //_LoginButton(),
          //_SignUp(),
        ],
      //),
    );

  }

  Widget _FinishButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {

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
          'Comentar',
          textAlign: TextAlign.center,
        ),
      ),
    );

  }

  Widget _publi(String phrase, String imageName) {
    return Post(
            isPost: false,
            username: 'alguien.x',
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
