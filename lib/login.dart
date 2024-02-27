import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      home: MyLogin(),
    );
  }
}

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
            
            children: <Widget>[
              
              Image(image: AssetImage('images/login.png'), width: 200,height: 200,),
              Container(
              height: 100,
              width:200),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _isValidEmail ? null : 'Invalid email format',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isValidEmail = _emailController.text.contains('');
                  });
                  if (_isValidEmail) {
                    print('Logged in with email: ${_emailController.text}');
                  }
                  Navigator.pushNamed(context, 'landing');
                },
                child: Text('Login'),
              ),
              TextButton(onPressed: (){
                Navigator.pushNamed(context,'vendorPencil' );
              }, child: Text('Login as Vendor'))
            ],
          ),
        ),
      ),
    );
  }
}
