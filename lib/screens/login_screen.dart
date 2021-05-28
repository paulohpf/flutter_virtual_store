import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (String text) {
                  return (text.isEmpty || !text.contains('@'))
                      ? 'E-mail inválido!'
                      : null;
                }),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
                validator: (String text) {
                  return (text.isEmpty || text.length < 6)
                      ? 'Senha inválida!'
                      : null;
                }),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.centerRight),
                onPressed: () {},
                child: const Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {}
                },
                child: const Text(
                  'Entrar',
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
