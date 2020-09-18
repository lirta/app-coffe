part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPassword = false;
  bool isSignIn = false;
  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentHitam)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: SizedBox(
                        height: 100,
                        child: Image.asset("assets/logo.png"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 40),
                      child: Text(
                        "Welcome Back, \nExplorer",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isEmailValid = EmailValidator.validate(text);
                        });
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          labelText: "Email Address",
                          hintText: "Email Address"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      onChanged: (text) {
                        setState(() {
                          isPassword = text.length >= 6;
                        });
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          labelText: "Password",
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Forget password? ",
                          style: blackTextFont.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Get New",
                          style: biruTextFont,
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(top: 40, bottom: 30),
                        child: isSignIn
                            ? SpinKitFadingCircle(
                                color: accentBiru,
                              )
                            : FloatingActionButton(
                                child: Icon(Icons.arrow_forward,
                                    color: isEmailValid && isPassword
                                        ? Colors.white
                                        : accentHitam),
                                backgroundColor: isEmailValid && isPassword
                                    ? b
                                    : accentPutih,
                                onPressed: isEmailValid && isPassword
                                    ? () async {
                                        setState(() {
                                          isSignIn = true;
                                        });
                                        SignInSignUpResult result =
                                            await AuthServices.singIn(
                                                emailController.text,
                                                passwordController.text);
                                        if (result.user == null) {
                                          setState(() {
                                            isSignIn = false;
                                          });
                                          Flushbar(
                                            duration: Duration(seconds: 4),
                                            flushbarPosition:
                                                FlushbarPosition.TOP,
                                            backgroundColor: accentHitam,
                                            message: result.message,
                                          )..show(context);
                                        }
                                      }
                                    : null),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Start Fresh Now? ",
                          style: blackTextFont.copyWith(
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Sign UP",
                          style: biruTextFont,
                        )
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
