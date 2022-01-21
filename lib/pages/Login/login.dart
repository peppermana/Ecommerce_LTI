import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/config/Utils.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  //masukan nilai email dan password dan dibungkus dalam bentuk map
  void setLogin(String email, String password, BuildContext context) {
    var data = {
      "email": email,
      "password": password,
    };

    //panggil function login kwmudian masukan data yang ada di variabel  data ke function login
    Api.Login(data).then((value) async {
      //jika hasil login berhasil
      if (value.message == "login user successful") {
        //ketika berhasil, webservice ini akan merespon nilai idUser dan username
        //maka masukan nilai response username dan idUser ke sharedpref
        LoginPref.saveToSharedPref(
            value.result!.idUser!, value.result!.username!);
        if (await LoginPref.checkpref() == true) {
          Navigator.of(context).pop();
        }
      //  cekpref, jika nilainya true maka pindah ke halaman sebelumnya
      } else {
        //jika login tidak sukses maka muncul eror di bawah
        Utils.showMessage("invalid email and password", context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Container(
                  child: Image.asset('assets/logo2.png'),
                ),
              ),
            ),
            Center(
              child: Text("anda harus login dahulu"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: "enter valid email as @example"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 0,
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: isVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "password",
                  hintText: "enter Secure Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        //input nilai yang berlawanan dengan nilai pada isVisible
                        //contoh isVisible bernilai true akan di input dengan nilai false
                        // begitu juga sebaliknya
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                        (isVisible)
                            ? Icons.visibility_off
                            : Icons.visibility),
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setLogin(
                      _emailController.text, _passwordController.text, context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                //   return Register();
                // }));
              },
              child: Text(
                "dont have an account sign up here!",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
