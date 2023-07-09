import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/name_field.dart';
import 'package:phrasis_frontend/widget/user_field.dart';
import 'package:phrasis_frontend/widget/area_field.dart';
import 'package:phrasis_frontend/widget/profile_picture.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Registro';
const String nextLabelText = 'Siguiente';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';

class Publication extends StatefulWidget {
  const Publication({super.key});

  @override
  State<Publication> createState() => _Publication();
}

class _Publication extends State<Publication> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController imageController = TextEditingController();
  TextEditingController userController = TextEditingController();
  String dropdownvalue = 'ES';
  String drop = 'Selecciona';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: phSecondary,
        appBar: _bar(),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child:
                SafeArea(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: Center(
                    child: _form(),
                  ),
                ),
              
            ),),
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
          _Title(),
          const SizedBox(height: 21),
          AreaField(controller: userController),
          const SizedBox(height: 13),
          CustomTextField(
            labelText: 'Imagen de fondo',
            validator: () {},
            prefixIcon: Icon(Icons.image),
            suffixIcon: IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: () {
                _getFromGallery();
              },
            ),
            controller: imageController,
          ),
          const SizedBox(height: 13),
          _Intereses(),
          const SizedBox(height: 13),
          _FinishButton(),
        ],
      ),
    );

  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() => imageController.text = pickedFile.path.split('/').last);
    }
  }

  Widget _Title() {
    return Text(
      'Publicar frase',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

    Widget _Intereses() {   
  
  // List of items in our dropdown menu
  var items = [ 
  'Selecciona',   
    'Motivación',
    'Tristeza',
    'Reflexión',
    'Romantico',
  ];

    return DropdownButtonFormField(
                
              // Initial Value
              value: drop,
              decoration: InputDecoration(
                labelText: 'Intereses',
                prefixIcon: Icon(Icons.interests),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) { 
                setState(() {
                  drop = newValue!;
                });
              },
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
          'Publicar',
          textAlign: TextAlign.center,
        ),
      ),
    );

  }

  Widget _prueba() {
    return //SizedBox(
      //height: 14,
      //child: 
      TextFormField(
        //maxLengh: 4,
      decoration: InputDecoration(
        
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: const EdgeInsets.only(bottom: 8, top: 8, left: 13),
      ),
      //),
      //style: TextStyle(fontSize: 12),
    );
  }

  AppBar _bar() {
    return AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        );
  }

}