import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/models/user_model.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        builder: ((context, state) {
          var model = SocialCubit.get(context).userModel;
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildChatItem(model!);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: SocialCubit.get(context).users.length);
        }),
        listener: (context, state) {});
  }

  Widget buildChatItem(
    SocialUserModel model,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('${model.image}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Text("${model.name}")
        ],
      ),
    );
  }
}
