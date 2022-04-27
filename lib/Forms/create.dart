import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:pfartists/Forms/login.dart';
import 'package:pfartists/components/providers.dart';
import 'package:pfartists/components/title_screen.dart';
import 'package:pfartists/components/logo.dart';
import 'package:pfartists/components/consent_expression.dart';

class Create extends StatelessWidget {
  const Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PlatformApp(
      color: Color.fromARGB(33, 33, 33, 1),
      home: CreateForm(),
    );
  }
}

class CreateForm extends StatelessWidget {
  const CreateForm({Key? key}) : super(key: key);

  final title = 'Zarejestruj się';
  final subTitle = 'Jeśli masz już konto:';
  final otherForm = 'Zaloguj się';
  final signInGoogle = 'Zaloguj się przez Google';

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < 600) {
        return HorCreateForm(
            title: title,
            subTitle: subTitle,
            otherForm: otherForm,
            signInGoogle: signInGoogle);
      } else {
        return VerCreateForm(
            title: title,
            subTitle: subTitle,
            otherForm: otherForm,
            signInGoogle: signInGoogle);
      }
    }));
  }
}

class HorCreateForm extends StatefulWidget {
  const HorCreateForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.otherForm,
      required this.signInGoogle})
      : super(key: key);

  final String title;
  final String subTitle;
  final String otherForm;
  final String signInGoogle;

  @override
  _HorCreateFormState createState() => _HorCreateFormState();
}

class _HorCreateFormState extends State<HorCreateForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Logo(),
          TitleScreen(
              title: widget.title,
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 10)),
          CreateBodyForm(
              title: widget.title,
              subTitle: widget.subTitle,
              otherForm: widget.otherForm,
              formKey: formKey),
          Providers(
              title: widget.signInGoogle,
              icon: Icon(
                PlatformIcons(context).upArrow,
                color: Colors.black,
                size: 25,
              )),
          const ConsentExpression()
        ],
      ),
    );
  }
}

class VerCreateForm extends StatefulWidget {
  const VerCreateForm(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.otherForm,
      required this.signInGoogle})
      : super(key: key);

  final String title;
  final String subTitle;
  final String otherForm;
  final String signInGoogle;

  @override
  _VerCreateFormState createState() => _VerCreateFormState();
}

class _VerCreateFormState extends State<VerCreateForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleScreen(
                    title: widget.title,
                    padding:
                        const EdgeInsets.only(top: 50, bottom: 0, left: 25)),
                CreateBodyForm(
                    title: widget.title,
                    subTitle: widget.subTitle,
                    otherForm: widget.otherForm,
                    formKey: formKey),
                Providers(
                    title: widget.signInGoogle,
                    icon: Icon(
                      PlatformIcons(context).upArrow,
                      color: Colors.black,
                      size: 25,
                    )),
                const ConsentExpression()
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
    );
  }
}

class VerMainBodyForm extends StatefulWidget {
  const VerMainBodyForm(
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
  _VerMainBodyFormState createState() => _VerMainBodyFormState();
}

class _VerMainBodyFormState extends State<VerMainBodyForm> {
  @override
  Widget build(BuildContext context) {
    String? _email;
    String? _password;
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

    dynamic _redirectedToCreate() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
      });
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            onSaved: (String? val) => _password = val,
            style: const TextStyle(
                fontSize: 18, decorationStyle: TextDecorationStyle.dashed),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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

class CreateBodyForm extends StatefulWidget {
  const CreateBodyForm(
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
  _CreateBodyFormState createState() => _CreateBodyFormState();
}

class _CreateBodyFormState extends State<CreateBodyForm> {
  @override
  Widget build(BuildContext context) {
    String? _email;
    String? _password;
    String? _formState;

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
                content: Text('formState: $_formState'),
              );
            });
      }
    }

    dynamic _redirectedToCreate() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Login()));
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        Text(dotenv.env['ANDROID_API_KEY']!)
      ],
    );
  }
}
