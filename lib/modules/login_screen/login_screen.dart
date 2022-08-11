import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/component.dart';
import '../../shared/constant.dart';
import '../register_screen/register_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
          builder: (BuildContext context, SocialLoginStates state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login now to chat with new friends',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    defaultFormField(
                        onSubmit: () {},
                        onTap: () {},
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value.isEmpty || value == null) {
                            return "Please , Enter you email";
                          }
                          return null;
                        },
                        label: "Email ",
                        prefix: Icons.email_outlined),
                    defaultFormField(
                        onSubmit: () {},
                        onTap: () {},
                        isPassword: true,
                        //suffix: ,
                        //suffixPressed: ,
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty || value == null) {
                            return "Please , Enter you Password";
                          }
                          return null;
                        },
                        label: "Password",
                        prefix: Icons.lock_outline),
                    defaultTextButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print(emailController.text);
                            SocialLoginCubit.get(context).userLogin(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                          }
                          print(emailController.text);
                        },
                        text: "Login"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Account ?  ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, const SocialRegisterScreen());
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(color: defaultColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SocialLoginErrorState) {
          showToast(txt: state.error);
        }
      }),
    );
  }
}
