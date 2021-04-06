import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tweety_app/blocs/login/Cubit.dart';
import 'package:tweety_app/repositories/AuthenticationRepository.dart';
import 'package:tweety_app/widgets/Wave.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF7F7F7),
      body: BlocProvider(
        create: (_) => LoginCubit(repository: context.read<AuthenticationRepository>()),
        child: Stack(
          children: [
            Container(
              height: size.height - 350,
              color: Color(0xff4A64FE),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: Wave(
                size: size,
                yOffset: size.height / 3.0,
                color: Color(0xFFF7F7F7),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tweety',
                    style: TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status.isSubmissionInProgress) {}

                if (state.status.isSubmissionSuccess) {
                  Fimber.d('Logged in');
                  // context.read<AuthBloc>().add(AuthUserChanged());
                }
              },
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _EmailInput(),
                      SizedBox(height: 30.0),
                      _PasswordInput(),
                      SizedBox(height: 50.0),
                      _SubmitButton(size: size),
                      SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account ?", style: TextStyle(color: Colors.black87, fontSize: 16.0)),
                          SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgot-password');
                          },
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          onChanged: (String value) => context.read<LoginCubit>().emailChanged(value),
          decoration: InputDecoration(
            filled: true,
            focusColor: Colors.white,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 3.0, color: Theme.of(context).primaryColor),
            ),
            prefixIcon: Icon(Icons.mail),
            hintText: 'Email',
            errorText: state.email.invalid ? 'Email is required.' : null,
          ),
          // autovalidate: true,
          // autocorrect: false,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            filled: true,
            focusColor: Theme.of(context).primaryColor,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 3.0, color: Theme.of(context).primaryColor),
            ),
            prefixIcon: Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              // icon: _isPasswordHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              icon: Icon(Icons.visibility),
              onPressed: () {
                // _toggleVisibility();
              },
            ),
            hintText: 'Password',
            errorText: state.password.invalid ? 'Password is required.' : null,
          ),
          onChanged: (String value) => context.read<LoginCubit>().passwordChanged(value),
          obscureText: true,
          // controller: _passwordController,
          autovalidateMode: AutovalidateMode.always,
          autocorrect: false,
          // validator: (_) {
          //   if (!state.isPasswordValid) {
          //     return ('Invalid Password');
          //   }
          //   return null;
          // },
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final Size size;

  const _SubmitButton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
            color: Theme.of(context).primaryColor,
            child: InkWell(
              onTap: state.status.isValidated ? () => context.read<LoginCubit>().login() : null,
              child: SizedBox(
                height: 50.0,
                width: size.width,
                child: Center(child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18.0, letterSpacing: 1.0))),
              ),
            ),
          ),
        );
      },
    );
  }
}
