import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/modules/settings/edit_profile.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 180.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0)),
                            image: DecorationImage(
                                image: NetworkImage("${userModel!.cover}"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    CircleAvatar(
                        radius: 54.0,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage:
                                NetworkImage("${userModel.image}")))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${userModel.name}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${userModel.bio} ",
                style: Theme.of(context).textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Posts ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            '5',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Photos ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            '200',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Followers ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            '300',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Followings ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text("Add Photos"))),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        navigateTo(context, EditProfile());
                      },
                      child: const Icon(IconBroken.edit))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
