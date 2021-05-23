import 'package:flutter/material.dart';
import 'package:movieapp2/Auth/auth_service.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            color: ColorsCollection.mainColor,
            height: 2,
          ),
        ),
        Text(
          "Movie Land",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: ColorsCollection.mainColor,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          "Please login to continue",
          style: TextStyle(
            fontSize: 16,
            color: ColorsCollection.mainColor,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(
              fontSize: 16,
              color: ColorsCollection.secondaryColor.withOpacity(.4),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: ColorsCollection.mainColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          obscureText: hidePassword,
          controller: passwordController,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(
                  (hidePassword)
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.solidEyeSlash,
                  size: 16,
                  color: ColorsCollection.secondaryColor),
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 16,
              color: ColorsCollection.secondaryColor.withOpacity(.4),
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: ColorsCollection.mainColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        GestureDetector(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: ColorsCollection.mainColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorsCollection.mainColor.withOpacity(0.4),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsCollection.secondaryColor,
                ),
              ),
            ),
          ),
          onTap: () async {
            AppProvider provider = Provider.of(context, listen: false);
            context
                .read<AuthService>()
                .signIn(
                    email: emailController.text,
                    password: passwordController.text)
                .then(
                  (_) => provider.getUid(),
                )
                .then((_) => {
                      provider.fetchnewsFav(),
                      provider.fetchMoviesFav(),
                      provider.fetchShowsFav(),
                      provider.getFavCount(),
                      provider.getuser(),
                    });
          },
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "FORGOT PASSWORD?",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsCollection.mainColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
