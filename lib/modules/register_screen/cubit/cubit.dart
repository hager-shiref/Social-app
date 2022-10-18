import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/modules/register_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());
  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
          email: email,
          name: name,
          phone: phone,
          uId: value.user!.uid,
          isEmailVerified: false);
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void userCreate(
      {required String email,
      required String name,
      required String phone,
      required String uId,
      required bool isEmailVerified}) {
    SocialUserModel model = SocialUserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,
        isEmailVerified: isEmailVerified,
        image:
            'https://cdn.icon-icons.com/icons2/1674/PNG/512/person_110935.png',
        bio: 'Write your bio .. ',
        cover:
            'https://img.freepik.com/free-vector/hand-drawn-floral-background-with-copy-space_79603-1942.jpg?w=996&t=st=1661885531~exp=1661886131~hmac=db2e0ff5ee2ac07c5098fa1609d8b157c5c9f78618e7a291540d194fbff59b26');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(SocialCreateUserErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
