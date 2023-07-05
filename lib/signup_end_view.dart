import 'package:flutter/material.dart';
import 'package:phrasis_frontend/widget/custom_text_field.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';
import 'package:phrasis_frontend/widget/name_field.dart';
import 'package:phrasis_frontend/widget/user_field.dart';
import 'package:phrasis_frontend/widget/area_field.dart';
import 'package:phrasis_frontend/widget/profile_picture.dart';
import 'package:intl/intl.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String titleText = 'Registro';
const String nextLabelText = 'Siguiente';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';

class SignUpEnd extends StatefulWidget {
  const SignUpEnd({super.key});

  @override
  State<SignUpEnd> createState() => _SignUpEnd();
}

class _SignUpEnd extends State<SignUpEnd> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String dropdownvalue = 'ES';
  String drop = 'Selecciona';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: phSecondary,
        appBar: _bar(),
        body: //Stack(children: [
          //_bar(),
          CustomScrollView(
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
        //_barr(),
      //],),
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
          //_Title(),
          //const SizedBox(height: 21),
          ProfilePicture(size: 34), 
          const SizedBox(height: 13),
          AreaField(controller: userController),
          const SizedBox(height: 13),
          
          _DateLabel(),
          const SizedBox(height: 13),
          _Idiomas(),
          
          const SizedBox(height: 13),
          _Intereses(),
          const SizedBox(height: 13),

          Container(
            width: double.infinity,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Flexible(flex: 57, child:_prueba()),
            Flexible(flex: 43, child: _prueba()),
            ],
          ),),
          
          _prueba(),
          //Text('b'),
          //Text('c'),
          // Fecha de nacimiento
          // ¿Cuando naciste?
          //PasswordField(controller: passwordController),
          //const SizedBox(height: 21),
           
          _FinishButton(),
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

  Widget _Idiomas() {   
  
  // List of items in our dropdown menu
  var items = [    
    'ES',
    'US',
  ];

    return DropdownButtonFormField(
                
              // Initial Value
              value: dropdownvalue,
              decoration: InputDecoration(
                labelText: 'Idioma',
                prefixIcon: Icon(Icons.language),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
      ),
              // Down Arrow Icon
              //icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
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
              // Down Arrow Icon
              //icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  drop = newValue!;
                });
              },
            );
  }

  Widget _DateLabel() {
    return CustomTextField(
      prefixIcon: const Icon(Icons.calendar_month),
      labelText: '¿Cuando naciste?',
      controller: dateController,
      isReadOnly: true,
      tapFunction: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(), //get today's date
          firstDate:DateTime(1960),//.now().subtract(Duration(days: 80 * 365)), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime.now().add(Duration(days: 30)), 
        );

                  if(pickedDate != null ){
                      print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                      print(formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                      setState(() {
                         dateController.text = formattedDate; //set foratted date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
            }
    );
  }

  Widget _FinishButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          /*Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                email: emailController.text,
              )
            ),
          );*/
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
              color: phPrimary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
  }

}