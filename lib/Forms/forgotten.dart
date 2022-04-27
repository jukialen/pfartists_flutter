import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
import 'package:pfartists/components/title_screen.dart';
import 'package:pfartists/components/logo.dart';

class Forgotten extends StatelessWidget {
  const Forgotten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
      color: Color.fromARGB(33, 33, 33, 1),
      home: ForgottenForm(),
    );
  }
}

class ForgottenForm extends StatelessWidget {
  const ForgottenForm({Key? key}) : super(key: key);

  final title = 'Przypomnienie hasła';
  final titleButton = 'Przypomnij hasło';
  final subTitle =
      'Wprowadź adres e-mail a my wyślemy tobie link aby zresetować hasło. ';
  final otherForm = 'Wróć';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return HorForgottenForm(
            title: title,
            subTitle: subTitle,
            otherForm: otherForm,
            titleButton: titleButton);
      } else {
        return VerForgottenForm(
          title: title,
          subTitle: subTitle,
          otherForm: otherForm,
          titleButton: titleButton,
        );
      }
    }));
  }
}

class HorForgottenForm extends StatefulWidget {
  const HorForgottenForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.otherForm,
      required this.titleButton})
      : super(key: key);

  final String title;
  final String subTitle;
  final String titleButton;
  final String otherForm;

  @override
  _HorForgottenFormState createState() => _HorForgottenFormState();
}

class _HorForgottenFormState extends State<HorForgottenForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    dynamic _redirectedToLogin() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      });
    }

    return PlatformScaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 104, 1),
      body: Center(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Logo(),
              TitleScreen(
                  title: widget.title,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
              ForgottenBodyForm(
                  title: widget.title,
                  subTitle: widget.subTitle,
                  titleButton: widget.titleButton,
                  formKey: formKey),
              Center(
                child: PlatformTextButton(
                  onPressed: _redirectedToLogin,
                  child: Text(
                    widget.otherForm,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 92, 174, 1), fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerForgottenForm extends StatefulWidget {
  const VerForgottenForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.otherForm,
      required this.titleButton})
      : super(key: key);

  final String title;
  final String subTitle;
  final String titleButton;
  final String otherForm;

  @override
  _VerForgottenFormState createState() => _VerForgottenFormState();
}

class _VerForgottenFormState extends State<VerForgottenForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    dynamic _redirectedToLogin() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      });
    }

    return PlatformScaffold(
      backgroundColor: const Color.fromRGBO(255, 208, 104, 1),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleScreen(
                      title: widget.title,
                      padding: const EdgeInsets.only(
                          top: 70, bottom: 10, right: 25, left: 25)),
                  ForgottenBodyForm(
                      title: widget.title,
                      subTitle: widget.subTitle,
                      titleButton: widget.titleButton,
                      formKey: formKey),
                  Center(
                    child: PlatformTextButton(
                      onPressed: _redirectedToLogin,
                      child: Text(
                        widget.otherForm,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 92, 174, 1),
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: const Logo(),
            )
          ],
        ),
      ),
    );
  }
}

class ForgottenBodyForm extends StatefulWidget {
  const ForgottenBodyForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.formKey,
      required this.titleButton})
      : super(key: key);

  final String title;
  final String subTitle;
  final String titleButton;
  final GlobalKey<FormState> formKey;

  @override
  _ForgottenBodyFormState createState() => _ForgottenBodyFormState();
}

class _ForgottenBodyFormState extends State<ForgottenBodyForm> {
  @override
  Widget build(BuildContext context) {
    String? _email;
    String? _formState;

    void _submit() {
      final form = widget.formKey.currentState;
      if (form?.validate() != null) {
        form?.save();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: Text('Email: $_email'),
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
          child: Text(
            widget.subTitle,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                fixedSize: const Size(240, 45),
              ),
              onPressed: _submit,
              child: Text(
                widget.titleButton,
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
