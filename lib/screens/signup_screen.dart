import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(hintText: 'Nome Completo'),
                validator: (String text) {
                  return (text.isEmpty) ? 'Nome inválido!' : null;
                }),
            const SizedBox(height: 16),
            TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (String text) {
                  return (text.isEmpty || !text.contains('@'))
                      ? 'E-mail inválido!'
                      : null;
                }),
            const SizedBox(height: 16),
            TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
                validator: (String text) {
                  return (text.isEmpty || text.length < 6)
                      ? 'Senha inválida!'
                      : null;
                }),
            const SizedBox(height: 16),
            TextFormField(
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
                  if (_formKey.currentState.validate()) {}
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
        ),
      ),
    );
  }
}
