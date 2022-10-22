// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/models/message_model.dart';
import 'package:social/models/user_model.dart';
import 'package:social/modules/chats/widgets/full_screen_image.dart';
import 'package:social/modules/chats/widgets/send_image_screen.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';

// ignore: must_be_immutable
class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  ChatDetailsScreen({super.key, required this.userModel});
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getTextMessages(receiverId: "${userModel.uId}");
      return BlocConsumer<SocialCubit, SocialStates>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('${userModel.image}'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('${userModel.name}')
                  ]),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SocialCubit.get(context).messages.length > 0
                          ? Expanded(
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var message = SocialCubit.get(context)
                                        .messages[index];
                                    if (SocialCubit.get(context)
                                            .userModel!
                                            .uId ==
                                        message.senderId) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          message.text != null
                                              ? buildMyMessage(message)
                                              : const SizedBox(
                                                  height: 1,
                                                ),
                                          message.image != null
                                              ? buildMyImageMessage(
                                                  context, message)
                                              : const SizedBox(
                                                  height: 1,
                                                )
                                        ],
                                      );
                                    } else {
                                      return Column(
                                        children: [
                                          message.text != null
                                              ? buildMessage(message)
                                              : const SizedBox(
                                                  height: 1,
                                                ),
                                          message.image != null
                                              ? buildImageMessage(
                                                  context, message)
                                              : const SizedBox(
                                                  height: 1,
                                                )
                                        ],
                                      );
                                    }
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 5,
                                    );
                                  },
                                  itemCount:
                                      SocialCubit.get(context).messages.length))
                          : const Expanded(child: Text("No messages yet")),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.0)),
                        child: Form(
                          key: formKey,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await SocialCubit.get(context)
                                        .getmessageImage();
                                    navigateTo(
                                        context,
                                        SendImageScreen(
                                            receiverId: userModel.uId));
                                  },
                                  icon: const Icon(IconBroken.image)),
                              Expanded(
                                flex: 6,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: textController,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: 'Type messages ...',
                                      border: InputBorder.none),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                    child: IconButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            SocialCubit.get(context)
                                                .sendTextMessage(
                                                    text: textController.text,
                                                    receiverId: userModel.uId,
                                                    image: null,
                                                    dateTime: DateTime.now()
                                                        .toString());
                                          }
                                          textController.clear();
                                        },
                                        icon: const Icon(
                                          IconBroken.send,
                                          color: Colors.white,
                                        )),
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
          listener: (context, state) {});
    });
  }

  Widget buildMessage(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        //margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        child: Text("${model.text}"),
      ),
    );
  }

  Widget buildImageMessage(BuildContext context, MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: InkWell(
          onTap: () {
            navigateTo(
                context,
                FullScreenImage(
                  image: model.image,
                ));
          },
          child: model.image != null
              ? Container(
                  height: 150,
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(model.image!),
                          fit: BoxFit.cover)),
                )
              : Text('')),
    );
  }

  Widget buildMyImageMessage(BuildContext context, MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: InkWell(
          onTap: () {
            navigateTo(
                context,
                FullScreenImage(
                  image: model.image,
                ));
          },
          child: model.image != null
              ? Container(
                  height: 150,
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(model.image!),
                          fit: BoxFit.cover)),
                )
              : Text('')),
    );
  }

  Widget buildMyMessage(MessageModel model) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
          ),
        ),
        child: Text("${model.text}"),
      ),
    );
  }
}
