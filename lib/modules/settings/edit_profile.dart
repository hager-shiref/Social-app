import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  var name = TextEditingController();
  var phone = TextEditingController();
  var bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Edit Profile", actions: [
        Center(
          child: InkWell(
            onTap: () {
              SocialCubit.get(context).updateUser(
                  name: name.text, phone: phone.text, bio: bio.text);
            },
            child: const Text(
              "Update",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ]),
      body: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          var userModel = SocialCubit.get(context).userModel;
          var profileImage = SocialCubit.get(context).profileImage;
          var coverImage = SocialCubit.get(context).coverImage;
          name.text = userModel!.name!;
          bio.text = userModel.bio!;
          phone.text = userModel.phone!;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0)),
                                    image: DecorationImage(
                                        image: coverImage == null
                                            ? NetworkImage("${userModel.cover}")
                                                as ImageProvider
                                            : FileImage(coverImage),
                                        fit: BoxFit.cover)),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: CircleAvatar(
                                      radius: 15,
                                      child: IconButton(
                                        onPressed: () {
                                          SocialCubit.get(context)
                                              .getCoverImage();
                                        },
                                        icon: const Icon(
                                          IconBroken.camera,
                                          size: 16,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          )),
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          CircleAvatar(
                              radius: 54.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: profileImage == null
                                      ? NetworkImage("${userModel.image}")
                                          as ImageProvider
                                      : FileImage(profileImage))),
                          Positioned(
                              right: 5,
                              bottom: 10,
                              child: CircleAvatar(
                                  radius: 15,
                                  child: IconButton(
                                    onPressed: () {
                                      SocialCubit.get(context)
                                          .getProfileImage();
                                    },
                                    icon: const Icon(
                                      IconBroken.camera,
                                      size: 16,
                                    ),
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if (SocialCubit.get(context).profileImage != null)
                        Expanded(
                            child: Column(
                          children: [
                            defaultTextButton(
                                function: () {
                                  SocialCubit.get(context).uploadProfileImage(
                                      name: name.text,
                                      phone: phone.text,
                                      bio: bio.text);
                                },
                                text: "Update image"),
                            if (state is SocialUpdateLoadingState)
                              const LinearProgressIndicator(),
                          ],
                        )),
                      const SizedBox(
                        width: 5,
                      ),
                      if (SocialCubit.get(context).coverImage != null)
                        Expanded(
                            child: Column(
                          children: [
                            defaultTextButton(
                                function: () {
                                  SocialCubit.get(context).uploadCoverImage(
                                      name: name.text,
                                      phone: phone.text,
                                      bio: bio.text);
                                },
                                text: "Update cover"),
                            //const LinearProgressIndicator()
                          ],
                        )),
                    ],
                  ),
                defaultFormField(
                    controller: name,
                    type: TextInputType.name,
                    onTap: () {},
                    onSubmit: () {},
                    validate: (value) {
                      if (value.isEmpty) {
                        return "name must not be empty";
                      }
                      return null;
                    },
                    label: "Name",
                    prefix: IconBroken.user),
                defaultFormField(
                    controller: bio,
                    type: TextInputType.name,
                    onTap: () {},
                    onSubmit: () {},
                    validate: (value) {
                      if (value.isEmpty) {
                        return "bio must not be empty";
                      }
                      return null;
                    },
                    label: "bio",
                    prefix: IconBroken.infoCircle),
                defaultFormField(
                    controller: phone,
                    type: TextInputType.name,
                    onTap: () {},
                    onSubmit: () {},
                    validate: (value) {
                      if (value.isEmpty) {
                        return "phone must not be empty";
                      }
                      return null;
                    },
                    label: "Phone",
                    prefix: IconBroken.call),
              ],
            ),
          );
        }),
      ),
    );
  }
}
