import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:she_flutter_application/languge_provider.dart';
import 'package:she_flutter_application/pref/shared_pref_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emaliController;
  late TextEditingController _passwordController;
  bool _obaexure = true;
  String? _errorTextEmail, _errorTextpass;
 late SharedPreferanceController sharedPreferanceController;

 late String? _languges ;
  bool? result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languges =sharedPreferanceController.languges;
    _emaliController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emaliController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              changLanguges();
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logOut();
            },
          ),
        ],
        title: Text(
          "email",
          style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.email,
            style: GoogleFonts.cairo(
                fontSize: 22,
                color: Colors.amberAccent,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "login",
            style: GoogleFonts.cairo(
                fontSize: 15,
                color: Colors.grey.shade300,
                fontWeight: FontWeight.normal),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emaliController,
            onSubmitted: (String value) {},
            maxLines: 3,
            minLines: 1,
            enabled: true,
            decoration: InputDecoration(
              counterText: '',
              prefixIcon: Icon(Icons.email_outlined),
              hintText: 'Enter Email',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.limeAccent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorText: _errorTextEmail,
              constraints: BoxConstraints(
                  maxHeight: _errorTextEmail == null ? 50 : 75, maxWidth: 300),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              fillColor: Colors.amberAccent,
              filled: true,
            ),
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _passwordController,
            onSubmitted: (String value) {},
            obscureText: _obaexure,
            maxLines: 1,
            minLines: 1,
            decoration: InputDecoration(
                counterText: '',
                prefixIcon: Icon(Icons.password),
                hintText: 'Enter Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.limeAccent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorText: _errorTextpass,
                constraints: BoxConstraints(
                    maxHeight: _errorTextpass == null ? 50 : 75, maxWidth: 300),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                fillColor: Colors.amberAccent,
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _obaexure = !_obaexure);
                  },
                  icon: Icon(_obaexure == false
                      ? Icons.remove_red_eye
                      : Icons.visibility_off),
                )),
          ),
          ElevatedButton(
            onPressed: () {
              perormLogin();
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(
                primary: Colors.limeAccent,
                elevation: 5,
                alignment: AlignmentDirectional.center,
                minimumSize: Size(double.infinity, (60))),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }

  void perormLogin() {
    if (checkData()) {
      login();
    }
  }
  bool checkData() {
    checkMethods();
    if (_emaliController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      return true;
    }
    checkMethods();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Enter the empty value!!")));
    return false;
  }
  void login() {
    sharedPreferanceController.save(email: _emaliController.text);
    Navigator.pushNamed(context, "/bot");
  }
  void checkMethods() {
    setState(() {
      _errorTextEmail = _emaliController.text.isEmpty ? 'Enter Email' : null;
      _errorTextpass = _passwordController.text.isEmpty ? 'Enter pass' : null;
    });
  }

  changLanguges() async{
   String? langCode= await showModalBottomSheet<String>(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.languges ,
                          style: GoogleFonts.cairo(
                              fontSize: 20, color: Colors.black),
                        ),
                        Text(AppLocalizations.of(context)!.chang_languges,
                        //  ,
                          style: GoogleFonts.cairo(
                              fontSize: 18, color: Colors.black45),
                        ),
                        RadioListTile<String>(
                            value: "ar",
                            groupValue: _languges,
                            onChanged: (String? value) {
                              if(value != null){
                                setState(()=> _languges =value);
                                Navigator.pop(context);
                              }
                            }),
                        RadioListTile<String>(
                            value: "en",
                            groupValue: _languges,
                            onChanged: (String? value) {
                              if(value != null){
                                setState(()=> _languges =value);
                                Navigator.pop(context);
                              }
                            }),
                      ],
                    );
                  }
                  );
            },
          );
        });

   if(langCode != null){
     Provider.of<LangugesProvider>(context ,listen: false).changLanguges();
   }
  }

  void logOut() async {
    result = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("log Ount"),
            actions: [
              TextButton(
                  onPressed: () async {
                    if (result ?? false) {
                      print('malsa');
                    bool remove = await  sharedPreferanceController.removeValueFrom( key: prefKey.login.name);
                    if(remove){
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, "/onbording");
                    }
                    }
                  },
                  child: Text("back")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel")),
            ],
          );
        });
  }
}
