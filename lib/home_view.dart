import 'package:flutter/material.dart';
import 'package:phrasis_frontend/signup_view.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/post.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Iniciar sesión';
const String loginLabelText = 'Entrar';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';

const String frase = "La política es el arte de buscar problemas, encontrarlos, realizar un diagnóstico falso y aplicar después remedios equivocados";

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
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: Center(
                    child: _form(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //const SizedBox(height: 55),
          //_title(),
          //const SizedBox(height: 34),
          //EmailField(controller: emailController),
          //const SizedBox(height: 21),
          //PasswordField(controller: passwordController),
          //const SizedBox(height: 21),
          Post(
            isPost: true,
            username: 'prueba',
            content: frase,
          ),
          //_LoginButton(),
          //_SignUp(),
        ],
      ),
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
