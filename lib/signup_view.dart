import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/name_field.dart';
import 'package:phrasis_frontend/widget/user_field.dart';
import 'package:phrasis_frontend/signup_end_view.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Registro';
const String nextLabelText = 'Siguiente';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate'; 

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
              color: phPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(21.0),
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
          //const SizedBox(height: 21),
          _Title(),
          const SizedBox(height: 34),
          UserField(controller: userController),
          const SizedBox(height: 21),
          NameField(controller: nameController),
          const SizedBox(height: 21),
          EmailField(controller: emailController),
          const SizedBox(height: 21),
          PasswordField(controller: passwordController),
          const SizedBox(height: 21),
          _NextButton(),
          //_SignUp(),
        ],
      ),
    );

  }

  Widget _Title() {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _NextButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUpEnd(),
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
          nextLabelText,
          textAlign: TextAlign.center,
        ),
      ),
    );

  }

}