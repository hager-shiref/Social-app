import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context: context, title: "Create Post", actions: [
          InkWell(
              onTap: () {},
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
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "What's on you mind ..",
                        border: InputBorder.none),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
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
                )
              ],
            );
          },
        ));
  }
}
