import 'package:flutter/material.dart';
import 'package:form_validation_bloc/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          emailField(),
          passwordField(),
          Padding(padding: EdgeInsets.only(bottom: 18)),
          submetButton(),
        ],
      ),
    );
  }

  emailField() {
    return StreamBuilder(
      stream: bloc.validatedEmail,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.changedEmail,
          decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email Adress',
              errorText: snapshot.error),
        );
      },
    );
  }

  passwordField() {
    return StreamBuilder(
      stream: bloc.validatedPassword,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changedPassword,
          decoration: InputDecoration(
              hintText: 'Password', labelText: 'Password', errorText: snapshot.error),
        );
      },
    );
  }

  submetButton() {
    return RaisedButton(
      child: Text("login"),
      color: Colors.blue[300],
      onPressed: () {},
    );
  }
}
