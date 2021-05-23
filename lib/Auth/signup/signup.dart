import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movieapp2/Auth/auth_service.dart';
import 'package:movieapp2/colors.dart';
import 'package:movieapp2/provider/appProvider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Sign up with",
          style: TextStyle(
            fontSize: 16,
            color: ColorsCollection.secondaryColor,
            height: 2,
          ),
        ),
        Text(
          "MOVIELAND",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: ColorsCollection.secondaryColor,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          controller: usernamecontroller,
          decoration: InputDecoration(
            hintText: 'Enter Username',
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Enter Email',
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
            fillColor: Colors.grey.withOpacity(0.1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          style: TextStyle(fontSize: 16, color: Colors.white),
          controller: passwordController,
          obscureText: hidePassword,
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
            fillColor: Colors.grey.withOpacity(0.1),
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
              color: ColorsCollection.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorsCollection.secondaryColor.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsCollection.mainColor,
                ),
              ),
            ),
          ),
          onTap: () async {
            AppProvider provider =
                Provider.of<AppProvider>(context, listen: false);
            var firebaseUser;
            context
                .read<AuthService>()
                .signUp(
                  email: emailController.text,
                  password: passwordController.text,
                )
                .then((_) => {
                      firebaseUser = Provider.of<User>(context, listen: false),
                      provider.addUser(
                        firebaseUser.uid,
                        usernamecontroller.text,
                        emailController.text,
                      ),
                    })
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
          height: 24,
        ),
        Text(
          "Or Signup with",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorsCollection.secondaryColor,
            height: 1,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.facebook_rounded,
              size: 32,
              color: ColorsCollection.secondaryColor,
            ),
            SizedBox(
              width: 24,
            ),
            Icon(
              Icons.g_translate_rounded,
              size: 32,
              color: ColorsCollection.secondaryColor,
            ),
          ],
        )
      ],
    );
  }
}
