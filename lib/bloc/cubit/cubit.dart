import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/models/user_model.dart';
import 'package:social/modules/chats/chats_screen.dart';
import 'package:social/modules/feeds/feeds_screen.dart';
import 'package:social/modules/new_post/new_post.dart';
import 'package:social/modules/settings/settings_screen.dart';
import 'package:social/modules/users/users_screen.dart';
import '../../shared/constant.dart';
import '../../shared/icons.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel? userModel;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data());
      print(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print("ERRRRRORRRRRRR + ${error.toString()}");
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen()
  ];
  List<String> titles = ['Home', 'Chats', 'New post', 'Users', 'Settings'];
  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeNavBarState());
    }
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(IconBroken.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.chat), label: 'Chats'),
    const BottomNavigationBarItem(icon: Icon(IconBroken.upload), label: 'Post'),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.location), label: 'Users'),
    const BottomNavigationBarItem(
        icon: Icon(IconBroken.setting), label: 'Settings'),
  ];
}
