import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: Signup(),

    );
  }
}
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);



  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("hello"),),
      body:  Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value==null){
                    return "enter value";
                  }
                },
                decoration: const InputDecoration(

                  labelText: 'Username',),
                controller: nameController,

              ),

              TextFormField(
                validator: (value){
                  if(value==null){
                    return "enter value";
                  }
                },
                decoration: const InputDecoration(

                  labelText: 'password',),
                controller: passwordController,
                obscureText: true,

              ),
              RaisedButton(onPressed:()=>_Signup(nameController,passwordController),
                child: Text("SignUp"),
              )


            ],
          )),
    );


  }
}
_Signup(TextEditingController nameController,TextEditingController passwordController)async{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: nameController.text, password: passwordController.text);

}

