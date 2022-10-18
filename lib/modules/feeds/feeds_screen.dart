import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/bloc/cubit/states.dart';
import 'package:social/shared/icons.dart';

import '../../models/post_model.dart';
import '../../shared/constant.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key}) : super(key: key);
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getUserData();
      return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var posts = SocialCubit.get(context).posts;
          return ConditionalBuilder(
              condition: SocialCubit.get(context).posts.isNotEmpty &&
                  SocialCubit.get(context).userModel != null,
              builder: (context) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            const Image(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/young-attractive-woman-smiling-feeling-healthy-hair-flying-wind_176420-37515.jpg?w=996&t=st=1661797413~exp=1661798013~hmac=d0c888f7ea5f3db7dc216b14d714cf88d393ba1adf8a245109b4dd15167284a6'),
                              fit: BoxFit.cover,
                              height: 220.0,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Communicate with friends',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildPostItem(posts[index], context, index),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10.0,
                        ),
                        itemCount: posts.length,
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                );
              },
              fallback: (context) {
                return const Center(child: CircularProgressIndicator());
              });
        },
      );
    });
  }

/*
ocialCubit.get(context).posts.isNotEmpty &&
                SocialCubit.get(context).userModel != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/young-attractive-woman-smiling-feeling-healthy-hair-flying-wind_176420-37515.jpg?w=996&t=st=1661797413~exp=1661798013~hmac=d0c888f7ea5f3db7dc216b14d714cf88d393ba1adf8a245109b4dd15167284a6'),
                            fit: BoxFit.cover,
                            height: 220.0,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Communicate with friends',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildPostItem(posts[index], context, index),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10.0,
                      ),
                      itemCount: posts.length,
                    ),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
 */
  Widget buildPostItem(PostModel model, context, index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.image}')),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: const TextStyle(height: 1.3),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: defaultColor,
                            size: 15.0,
                          )
                        ],
                      ),
                      Text(
                        '${model.dateTime} ',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.3),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      size: 16,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text(
              "${model.text}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5.0),
                      child: SizedBox(
                        height: 25.0,
                        child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Text(
                            '#Sky',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5.0),
                      child: SizedBox(
                        height: 25.0,
                        child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Text(
                            '#BlueSky',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5.0),
                      child: SizedBox(
                        height: 25.0,
                        child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Text(
                            '#BeautifulSky',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (model.postImage != '')
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: NetworkImage("${model.postImage}"),
                        fit: BoxFit.cover)),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              IconBroken.heart,
                              size: 16.0,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              SocialCubit.get(context).likes[index].toString(),
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              IconBroken.chat,
                              size: 16.0,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${SocialCubit.get(context).comments.length} comment',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "${SocialCubit.get(context).userModel!.image}")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: TextFormField(
                            controller: commentController,
                            decoration: const InputDecoration(
                                hintText: 'Write a comment ..',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                                border: InputBorder.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        SocialCubit.get(context).writeComment(
                            postId: SocialCubit.get(context).postsId[index],
                            comment: commentController.text);
                        commentController.clear();
                        SocialCubit.get(context).getPosts();
                      },
                      icon: const Icon(
                        IconBroken.send,
                        size: 16,
                      )),
                  IconButton(
                    onPressed: () {
                      SocialCubit.get(context).likePost(
                          postId: SocialCubit.get(context).postsId[index]);
                    },
                    icon: const Icon(
                      IconBroken.heart,
                      color: Colors.red,
                      size: 16.0,
                    ),
                  ),
                  Text(
                    'Like',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ));
}
