import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height + 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.amber.shade100,
        title: const Text(
          'SignUp Screen',
          style: TextStyle(fontSize: 16, letterSpacing: 0.01),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                //change focus node using common util method
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
                //change focus node using standard method
                //FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordcontroller,
                  obscureText: _obsecurePassword.value,
                  obscuringCharacter: "*",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_open_rounded),
                    suffixIcon: InkWell(
                      onTap: () {
                        _obsecurePassword.value = !_obsecurePassword.value;
                      },
                      child: Icon(_obsecurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'Sign Up',
              loading: authViewMode.signUpLoading,
              onPress: () {
                if (_emailcontroller.text.isEmpty) {
                  Utils.flushbarErrorMessage('Please enter email', context);
                } else if (_passwordcontroller.text.isEmpty) {
                  Utils.flushbarErrorMessage('Please enter password', context);
                } else if (_passwordcontroller.text.length < 6) {
                  Utils.flushbarErrorMessage(
                      'Please enter valid password', context);
                } else {
                  Map data = {
                    'email': _emailcontroller.text.toString(),
                    'password': _passwordcontroller.text.toString(),
                  };
                  authViewMode.signUpApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
