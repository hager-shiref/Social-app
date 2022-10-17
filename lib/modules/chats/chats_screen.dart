import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/models/user_model.dart';
import 'package:social/modules/chats/chat_details_screen.dart';
import 'package:social/shared/component.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var model = SocialCubit.get(context).users;
      return BlocConsumer<SocialCubit, SocialStates>(
          builder: ((context, state) {
            //var model = SocialCubit.get(context).users;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildChatItem(model[index], context);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: SocialCubit.get(context).users.length);
          }),
          listener: (context, state) {});
    });
  }

  Widget buildChatItem(SocialUserModel model, BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, ChatDetailsScreen(userModel: model));
      },
      child: Padding(
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
      ),
    );
  }
}
