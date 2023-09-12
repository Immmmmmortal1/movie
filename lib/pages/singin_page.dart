import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SingInPage extends StatefulWidget {
  const SingInPage({Key? key}) : super(key: key);
  @override
  _SingInPageState createState() => _SingInPageState();

}
class _SingInPageState extends State<SingInPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

   @override
  void initState() {
    super.initState();
    _loadStoredPersInfo();
  }

  Future<void> _loadStoredPersInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('username') ?? '';
      surnameController.text = prefs.getString('surname') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      usernameController.text = prefs.getString('username') ?? '';
    });
  }
  void _signIn() async { 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: nameController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                labelText: ('Ad'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.black45),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: surnameController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                labelText: ('Surname'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.black45),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: usernameController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                labelText: ('Username'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.black45),
                ),
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
                labelText: ('Password'),
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
                _signIn();
                FocusScope.of(context).unfocus();
              },
              style:  ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.black12),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
            ), 
             child: const Text(
                ('singin'),
                style: TextStyle(color: Colors.black),
              ),
          )
          )
          ]
        )
      )
    );
  }
}