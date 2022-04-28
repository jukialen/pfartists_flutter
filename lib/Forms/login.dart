import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pfartists/Forms/create.dart';
import 'package:pfartists/Forms/forgotten.dart';
import 'package:pfartists/components/providers.dart';
import 'package:pfartists/components/title_screen.dart';
import 'package:pfartists/components/logo.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
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

    dynamic _redirectedToForgotten() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Forgotten()));
      });
    }

    return PlatformScaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 104, 1),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Logo(),
              const TitleScreen(
                  title: 'Login',
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
              LoginBodyForm(
                  title: 'Login',
                  subTitle: 'Jeśli nie masz jeszcze konta:',
                  otherForm: 'Zarejestruj się',
                  formKey: formKey),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10, top: 10),
                    child: Text('Jeśli zapomniałeś hasła:',
                        style: TextStyle(fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 10),
                    child: OutlinedButton(
                        onPressed: _redirectedToForgotten,
                        child: const Text('Przypomnij hasło')),
                  ),
                ],
              ),
              Providers(
                  title: "Sign in with Google",
                  icon: Icon(
                    PlatformIcons(context).upArrow,
                    color: Colors.black,
                    size: 25,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LoginBodyForm extends StatefulWidget {
  const LoginBodyForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.otherForm,
      required this.formKey})
      : super(key: key);

  final String title;
  final String subTitle;
  final String otherForm;
  final GlobalKey<FormState> formKey;

  @override
  _LoginBodyFormState createState() => _LoginBodyFormState();
}

class _LoginBodyFormState extends State<LoginBodyForm> {
  @override
  Widget build(BuildContext context) {
    String? _email;
    String? _password;
    String? _formEmailState;
    String? _formPassState;

    void _submit() {
      final form = widget.formKey.currentState;
      if (form?.validate() != null) {
        form?.save();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return PlatformAlertDialog(
                title: const Text('Alert'),
                content: Text('Email: $_email, password: $_password'),
              );
            });
      } else {
        form?.save();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return PlatformAlertDialog(
                title: const Text('Form error'),
                content: Text('formEmailState: $_formEmailState, formPassState: $_formPassState'),
              );
            });
      }
    }

    dynamic _redirectedToCreate() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Create()));
      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            Text(
              widget.subTitle,
              style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
            ),
            PlatformTextButton(
              onPressed: _redirectedToCreate,
              child: Text(
                widget.otherForm,
                style: const TextStyle(
                    color: Color.fromRGBO(255, 92, 174, 1), fontSize: 20),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PlatformTextFormField(
            validator: (String? value) {
              RegExp regexEmail = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

              if (value == null || value.isEmpty) {
                return _formEmailState = 'Please enter e-mail';
              } else if (!regexEmail.hasMatch(value)) {
                return _formEmailState = 'Not a valid email.';
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            material: (_, __) => MaterialTextFormFieldData(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            hintText: 'Enter your email',
            onSaved: (String? val) => _email = val,
            cupertino: (_, __) => CupertinoTextFormFieldData(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(20.0))),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PlatformTextFormField(
            validator: (String? value) {
              RegExp regexPasswordOl = RegExp(r'/[A-Z]/g');
              RegExp regexPasswordHKik = RegExp(r'/[a-ząćęłńóśźżĄĘŁŃÓŚŹŻぁ-んァ-ヾ一-龯]*/g');
              RegExp regexPasswordOn = RegExp(r'/[0-9]+/g');
              RegExp regexPasswordSpec = RegExp(r'/[#?!@%^&*-]+/g');

              if (value == null || value.isEmpty) {
                return _formPassState = 'Please enter password';
              } else if (!regexPasswordOl.hasMatch(value)) {
                return _formPassState =
                    'Hasło musi zawierać conajmniej jedną dużą literę.';
              } else if (!regexPasswordHKik.hasMatch(value)) {
                return _formPassState =
                    'Hasło przyjmuje tylko litery. Mogą to być znaki Hiragany, Katakany i kanji.';
              } else if (!regexPasswordOn.hasMatch(value)) {
                return _formPassState = 'Hasło musi mieć conajmniej 1 cyfrę.';
              } else if (!regexPasswordSpec.hasMatch(value)) {
                return _formPassState =
                    'Hasło musi zawierać conajmniej 1 znak specjalny: #?!@%^&*-';
              } else if (value.length < 9) {
                return _formPassState =
                    'Hasło jest za krótkie. Musi mieć minimum 9 znaków.';
              }
            },
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            material: (_, __) => MaterialTextFormFieldData(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Enter your password',
            onSaved: (String? val) => _password = val,
            style: const TextStyle(
                fontSize: 18, decorationStyle: TextDecorationStyle.dashed),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(240, 45),
              ),
              onPressed: _submit,
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
