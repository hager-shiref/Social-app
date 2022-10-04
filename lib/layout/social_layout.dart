import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/modules/new_post/new_post.dart';
import 'package:social/shared/component.dart';
import 'package:social/shared/icons.dart';
import '../bloc/cubit/states.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(cubit.titles[cubit.currentIndex]),
            shadowColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(IconBroken.notification)),
              IconButton(onPressed: () {}, icon: const Icon(IconBroken.search))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndex,
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
/* email verification
Column(
              children: [
                if(!FirebaseAuth.instance.currentUser!.emailVerified)
                  Container(
                    height: 40,
                    color: Colors.amberAccent.withOpacity(0.5),
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline),
                          const SizedBox(width: 15,),
                          const Expanded(
                            child: Text("Please verify your email",style: TextStyle(
                                fontWeight: FontWeight.w800
                            )
                            ),
                          ),
                          InkWell(
                            child:const Text('Send',style: TextStyle(color: Colors.blue),),
                            onTap: (){
                              FirebaseAuth.instance.currentUser!.sendEmailVerification()
                                  .then((value){
                                    showToast(txt: 'Check you mail');
                              }).catchError((error){
                                print("Error : ${error.toString()}");
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  )
              ],
            )
*/