
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
   final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String _storedP = "";
  String _storedU = "";
  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedP = (prefs.getString('password') ?? '');
      _storedU = (prefs.getString('username') ?? '');
    });
  }
  void _login() {
    String enterP = passwordController.text;
    String enterU = usernameController.text;
    if (enterP == _storedP &&
        enterU == _storedU) {
      if (kDebugMode) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    } else {
      if (kDebugMode) {
        print("Şifre yanlış!");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: usernameController,
                style: Theme.of(context).textTheme.bodyLarge,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: tr('username'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black45),
                  )
                ),
              ),
              ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                controller: passwordController,
                style: Theme.of(context).textTheme.bodyLarge,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: tr('password'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black45),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: TextButton (
                onPressed: () {
                  _login();
                  FocusScope.of(context).unfocus();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black12),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                ),
              ),
              child: Text(
                  tr('login'),
                  style: const TextStyle(color: Colors.black),
                ),
            ),
            )  
          ],
        ),
      ),
    );
  }
}