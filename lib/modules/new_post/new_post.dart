import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context: context, title: "Create Post", actions: [
          InkWell(
              onTap: () {
                var now = DateTime.now();
                if (SocialCubit.get(context).postImage == null) {
                  SocialCubit.get(context).createPost(
                      text: textController.text, dateTime: now.toString());
                } else {
                  SocialCubit.get(context).uploadPostImage(
                      dateTime: now.toString(), text: textController.text);
                }
              },
              child: const Center(
                  child: Text("POST", style: TextStyle(color: Colors.blue)))),
          const SizedBox(
            width: 20,
          )
        ]),
        body: BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var userModel = SocialCubit.get(context).userModel;
            var postImage = SocialCubit.get(context).postImage;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage("${userModel!.image}"))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${userModel.name}"),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "public",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "What's on your mind ..",
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (postImage != null)
                  Expanded(
                    flex: 2,
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
                                  image: FileImage(postImage),
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
                                    SocialCubit.get(context).removePostImage();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 16,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            children: const [
                              Icon(IconBroken.image),
                              SizedBox(
                                width: 4,
                              ),
                              Text("add photo ")
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {}, child: const Text(" # tags ")),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
