import 'package:flutter/material.dart';
import 'package:kuis_123210167/gamelist.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'm' && password == 'm') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GameListScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau Password salah'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Login',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.pink[100],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(55.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Miawaug Games',
                            textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border( bottom: BorderSide(color: Colors.purple, width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          //
                          height: 40.0,
                          child: ElevatedButton(
                            onPressed: () => _login(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
