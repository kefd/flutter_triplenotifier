import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:triple_example/controller/authentication_valuenotifier_controller.dart';
import 'package:triple_example/store/valuenotifier_store.dart';
import 'package:triple_example/ui/components/auth_menu_component.dart';
import 'package:triple_example/utils/form_utils.dart';

class LoginValueNotifierPage extends StatelessWidget {
  LoginValueNotifierPage({Key? key}) : super(key: key);

  final AuthenticationValueNotifierController
      _authenticationValueNotifierController =
      AuthenticationValueNotifierController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                  tag: 'hero',
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 48.0,
                                    child: Image.asset('assets/logo.png'),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: TextFormField(
                                  controller:
                                      _authenticationValueNotifierController
                                          .emailTextController,
                                  validator: FormUtils.textFieldEmailValidator,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  // initialValue: 'emailtest@gmail.com',
                                  decoration: InputDecoration(
                                      labelText: 'Email...',
                                      //hintText: 'Email...',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20.0, vertical: 10.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0))),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 24.0),
                                  child: ValueListenableBuilder(
                                    valueListenable:
                                        _authenticationValueNotifierController
                                            .passwordVisibility,
                                    builder: (_, bool passwordVisibility, __) =>
                                        TextFormField(
                                      controller:
                                          _authenticationValueNotifierController
                                              .passwordTextController,
                                      validator:
                                          FormUtils.textFieldPasswordValidator,
                                      autofocus: false,
                                      // initialValue: 'Sua senha',
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                          //hintText: 'Senha...',
                                          labelText: 'Senha...',
                                          prefixIcon: const Icon(Icons.lock),
                                          suffixIcon: IconButton(
                                              icon: passwordVisibility
                                                  ? const Icon(Icons.visibility)
                                                  : const Icon(
                                                      Icons.visibility_off),
                                              onPressed: () =>
                                                  _authenticationValueNotifierController
                                                          .passwordVisibility
                                                          .value =
                                                      !_authenticationValueNotifierController
                                                          .passwordVisibility
                                                          .value),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 10.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.0))),
                                    ),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                      24.0))),
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              Theme.of(context).primaryColor),
                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                              const EdgeInsets.all(12.0))),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: ValueListenableBuilder(
                                                    valueListenable:
                                                        _authenticationValueNotifierController
                                                            .status,
                                                    builder: (_,
                                                        Status statusValue,
                                                        __) {
                                                      switch (statusValue) {
                                                        case Status.error:
                                                          //SchedulerBinding
                                                          WidgetsBinding.instance!.addPostFrameCallback((_) => ScaffoldMessenger
                                                                  .of(context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      _authenticationValueNotifierController
                                                                          .error
                                                                          .content))));
                                                          return const Text(
                                                              'Acessar');
                                                        case Status.loading:
                                                          return const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              child: CircularProgressIndicator(
                                                                  color: Colors
                                                                      .white));
                                                        case Status.start:
                                                        case Status.success:
                                                          return const Text(
                                                              'Acessar',
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white));
                                                      }
                                                    })),
                                          ]),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _authenticationValueNotifierController
                                              .login();
                                        }
                                      })),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Esqueceu a senha?',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor))),
                              TextButton(
                                  onPressed: () {
                                    QR.navigator.replaceAll('/signup');
                                  },
                                  child: Text('Cadastrar-se',
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor)))
                            ]))))),
        bottomNavigationBar: authMenu(0));
  }
}
