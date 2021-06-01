import 'package:flutter/material.dart';
import 'package:flutter_virtual_store/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ScopedModelDescendant<UserModel>(
          builder: (BuildContext context, Widget child, UserModel model) {
            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(hintText: 'Nome Completo'),
                    validator: (String text) {
                      return (text.isEmpty) ? 'Nome inválido!' : null;
                    }),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String text) {
                      return (text.isEmpty || !text.contains('@'))
                          ? 'E-mail inválido!'
                          : null;
                    }),
                const SizedBox(height: 16),
                TextFormField(
                    controller: _passController,
                    decoration: const InputDecoration(hintText: 'Senha'),
                    obscureText: true,
                    validator: (String text) {
                      return (text.isEmpty || text.length < 6)
                          ? 'Senha inválida!'
                          : null;
                    }),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: 'Endereço'),
                  validator: (String text) {
                    return (text.isEmpty) ? 'Endereço inválido!' : null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        final Map<String, dynamic> userData = <String, dynamic>{
                          'name': _nameController.text,
                          'email': _emailController.text,
                          'address': _addressController.text,
                        };

                        model.signUp(
                          userData: userData,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
                    },
                    child: const Text(
                      'Criar Conta',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.white),
                        primary: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onSuccess() {}

  void _onFail() {}
}
