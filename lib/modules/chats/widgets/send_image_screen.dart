import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/shared/icons.dart';

import '../../../bloc/cubit/cubit.dart';

class SendImageScreen extends StatelessWidget {
  String? receiverId;
  SendImageScreen({super.key, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Align(
            //alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image:
                              FileImage(SocialCubit.get(context).messageImage!),
                          fit: BoxFit.contain,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text('Send'),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            icon: const Icon(IconBroken.send),
                            onPressed: () {
                              SocialCubit.get(context).uploadMessageImage(
                                  dateTime: DateTime.now().toString(),
                                  receiverId: receiverId!);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
