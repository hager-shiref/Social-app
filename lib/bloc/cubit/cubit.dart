import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/models/post_model.dart';
import 'package:social/models/user_model.dart';
import 'package:social/modules/chats/chats_screen.dart';
import 'package:social/modules/feeds/feeds_screen.dart';
import 'package:social/modules/new_post/new_post.dart';
import 'package:social/modules/settings/settings_screen.dart';
import 'package:social/modules/users/users_screen.dart';
import '../../shared/constant.dart';
import '../../shared/icons.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  //=======================================================================================================================================================
  //getUser
  SocialUserModel? userModel;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void getUserData() {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print("ERRRRRORRRRRRR + ${error.toString()}");
      }
      emit(SocialGetUserErrorState(error.toString()));
    });
  }
//=======================================================================================================================================================
  //NavBar

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    NewPostScreen(),
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

  //=======================================================================================================================================================
  //pick image

  File? profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
      emit(SocialProfileImagePickedErrorState());
    }
  }
//=======================================================================================================================================================
//pick cover

  File? coverImage;
  var coverPicker = ImagePicker();
  Future<void> getCoverImage() async {
    final pickedFile = await coverPicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
      emit(SocialCoverImagePickedErrorState());
    }
  }
//=======================================================================================================================================================

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(profileImage!.path).pathSegments.last}")
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUpdateProfileImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(SocialUpdateProfileImageErrorState());
        print("Error1 : ${error.toString()}");
      });
    }).catchError((error) {
      emit(SocialUpdateProfileImageErrorState());
      print("Error2 : ${error.toString()}");
    });
  }
//=======================================================================================================================================================

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("users/${Uri.file(coverImage!.path).pathSegments.last}")
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUpdateCoverImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, cover: value);
      }).catchError((error) {
        emit(SocialUpdateCoverImageErrorState());
        print("Error1 : ${error.toString()}");
      });
    }).catchError((error) {
      emit(SocialUpdateCoverImageErrorState());
      print("Error2 : ${error.toString()}");
    });
  }
//=======================================================================================================================================================

  void updateUser(
      {required String name,
      required String phone,
      required String bio,
      String? cover,
      String? image}) {
    emit(SocialUpdateLoadingState());
    SocialUserModel model = SocialUserModel(
        name: name,
        phone: phone,
        email: userModel!.email,
        isEmailVerified: userModel!.isEmailVerified,
        uId: userModel!.uId,
        image: image ?? userModel!.image,
        bio: bio,
        cover: cover ?? userModel!.cover);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUpdateErrorState());
    });
  }
  //=======================================================================================================================================================

  File? postImage;
  var postPicker = ImagePicker();
  Future<void> getPostImage() async {
    final pickedFile = await postPicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostPickedSuccessState());
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
      emit(SocialPostPickedErrorState());
    }
  }

  void uploadPostImage({required String dateTime, required String text}) {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("posts/${Uri.file(postImage!.path).pathSegments.last}")
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(text: text, dateTime: dateTime, postImage: value);
      }).catchError((error) {
        emit(SocialCreatePostErrorState(error.toString()));
        print("Error1 : ${error.toString()}");
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState(error.toString()));
      print("Error2 : ${error.toString()}");
    });
  }

  void createPost(
      {required String text, required String dateTime, String? postImage}) {
    emit(SocialCreatePostLoadingState());
    PostModel postModel = PostModel(
        dateTime: dateTime,
        text: text,
        image: userModel!.image,
        name: userModel!.name,
        uId: userModel!.uId,
        postImage: postImage ?? '');

    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) {
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState(error.toString()));
    });
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }
  //=======================================================================================================================================================

  List<PostModel> posts = [];

  void getPosts() {
    emit(SocialGetPostsLoadingState());
    //to get all docs in posts collection
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      //to get all posts data and store it in posts list
      for (var element in value.docs) {
        posts.add(PostModel.fromJson(element.data()));
      }
      emit(SocialGetPostsSuccessState());
    }).catchError((error) {
      emit(SocialGetPostsErrorState(error.toString()));
    });
  }
}
