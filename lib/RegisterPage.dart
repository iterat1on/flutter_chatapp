import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled2/SuccessRegister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterForm(),
    );
  }
}
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _authentication = FirebaseAuth.instance;
  bool saving = false;
  String email = '';
  String password = '';
  String userName = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Email"
                  ),
                  onChanged:(value){
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password"
                  ),
                  onChanged:(value){
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "User name"
                  ),
                  onChanged:(value){
                    userName = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed:() async{
                  try{
                    setState(() {
                      saving = true;
                    });
                    final newUser = await _authentication.createUserWithEmailAndPassword(email: email, password: password);
                    await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                      'userName' : userName,
                      'email' : email,

                    });
                    if (newUser.user != null){
                      _formKey.currentState!.reset();
                      if(!mounted) return;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessRegisterPage()));
                      setState(() {
                        saving = false;
                      });
                    }
                  } catch(e){
                    print(e);
                  }

                } , child: const Text("Enter")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("If you already register,"),
                    TextButton(
                      child: const Text("log in with your email"),
                    onPressed: (){
                        Navigator.pop(context);
                    },
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
