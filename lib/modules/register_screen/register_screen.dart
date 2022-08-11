import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/social_layout.dart';
import '../../shared/component.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SocialRegisterScreen extends StatelessWidget {
  const SocialRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
          builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text("Register",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "RegisterNow to Chat with new friends",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultFormField(
                      onSubmit: () {},
                      onTap: () {},
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                      label: "userName",
                      prefix: Icons.person,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      onSubmit: () {},
                      onTap: () {},
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email address';
                        }
                        return null;
                      },
                      label: "emailAddress",
                      prefix: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                        onSubmit: () {},
                        onTap: () {},
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty || value == null) {
                            return 'password is too short';
                          }
                          return null;
                        },
                        label: "password",
                        prefix: Icons.lock_outline,
                        suffix: SocialRegisterCubit.get(context).suffix,
                        isPassword: SocialRegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          SocialRegisterCubit.get(context)
                              .changePasswordVisibility();
                        }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      onSubmit: () {},
                      onTap: () {},
                      controller: phoneController,
                      type: TextInputType.phone,
                      validate: (value) {
                        if (value.isEmpty || value == null) {
                          return 'please enter your phone number';
                        }
                        return null;
                      },
                      label: "phone",
                      prefix: Icons.phone,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    state is! SocialRegisterLoadingState
                        ? defaultTextButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                SocialRegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text);
                              }
                            },
                            text: "Register")
                        : const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is SocialCreateUserSuccessState) {
          navigateAndFinish(context, const SocialLayout());
        }
      }),
    );
  }
}
