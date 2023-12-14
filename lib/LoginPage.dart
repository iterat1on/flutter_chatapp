import 'package:flutter/material.dart';
import 'package:untitled2/ChatPage.dart';
import 'RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginForm(),
    );
  }
}
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool saving = false;
  String email = '';
  String password = '';
  final _authentication = FirebaseAuth.instance;
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
                ElevatedButton(onPressed:() async{

                  try{
                    setState(() {
                      saving = true;
                    });
                    final currentUser =
                    await _authentication.signInWithEmailAndPassword(email: email, password: password);

                    if(currentUser != null){
                      _formKey.currentState!.reset();
                    }
                    setState(() {
                      saving = false;
                    });
                  }catch (e){
                    print(e);
                  }

                } , child: Text("Enter")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("If you do not register,"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text("Register your email"),)
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}
