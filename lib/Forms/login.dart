import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pfartists/Forms/create.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
      title: 'Login',
      color: Color.fromARGB(33, 33, 33, 1),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String? _email;
    String? _password;
    String? _formState;

    void _submit() {
      final form = formKey.currentState;
      if (form?.validate() != null) {
        form?.save();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: Text('Email: $_email, password: $_password'),
              );
            });
      } else {
        form?.save();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Form error'),
                content: Text('formState: $_formState'),
              );
            });
      }
    }

    void _redirectedToCreate() {
      Navigator.pushNamed(context, '/create');
    }

    return PlatformScaffold(
      backgroundColor: const Color.fromRGBO(255, 199, 79, 1),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login',
                style: TextStyle(fontSize: 40, height: 5),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: PlatformTextFormField(
                  validator: (String? value) {
                    if (value?.contains('@') != false) {
                      _formState = 'Not a valid email.';
                    } else if (value == null || value.isEmpty) {
                      _formState = 'Please enter some text';
                    }
                    return _formState;
                  },
                  keyboardType: TextInputType.emailAddress,
                  material: (_, __) => MaterialTextFormFieldData(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),

                  hintText: 'Enter your email',
                  onSaved: (String? val) => _email = val,

                  cupertino: (_, __) => CupertinoTextFormFieldData(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: PlatformTextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      _formState = 'Please enter password';
                    }
                    return _formState;
                  },
                  obscureText: true,
                  material: (_, __) => MaterialTextFormFieldData(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Enter your password',
                  onSaved: (String? val) => _email = val,
                  style: const TextStyle(
                      fontSize: 18,
                      decorationStyle: TextDecorationStyle.dashed),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: PlatformElevatedButton(
                  onPressed: _submit,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 22, color: Color.fromRGBO(51, 51, 51, 1), ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(20),
                child: 	OutlinedButton(
                  onPressed: () {
                    _redirectedToCreate();
                    },
                    child: Text(
                    'Przypomnij hasło',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 92, 174, 1),
                        fontSize: 20
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
