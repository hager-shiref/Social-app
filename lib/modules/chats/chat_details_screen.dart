import 'package:flutter/material.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/models/user_model.dart';
import 'package:social/shared/icons.dart';

// ignore: must_be_immutable
class CharDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  CharDetailsScreen({super.key, required this.userModel});
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildMyMessage();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: 1)),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.0)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'type your messages here...',
                            border: InputBorder.none),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.blue,
                      child: IconButton(
                          onPressed: () {
                            SocialCubit.get(context).sendMessage(
                                text: textController.text,
                                reseiverId: "${userModel.uId}",
                                dateTime: DateTime.now().toString());
                            textController.clear();
                          },
                          icon: const Icon(
                            IconBroken.send,
                            color: Colors.white,
                          )),
                    ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget buildMessage() {
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
        child: const Text("Hello World"),
      ),
    );
  }

  Widget buildMyMessage() {
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
        child: const Text("Hello World"),
      ),
    );
  }
}
