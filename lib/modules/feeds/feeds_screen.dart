import 'package:flutter/material.dart';
import 'package:social/shared/icons.dart';

import '../../shared/constant.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
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
            physics:const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index)=>buildPostItem(context),
          separatorBuilder: (context,index)=>const SizedBox(
            height: 10.0,
          ),
          itemCount: 10,),
          const SizedBox(height: 8,)
        ],

      ),
    );
  }
  Widget buildPostItem(context)=>Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/indoor-portrait-charming-young-woman-with-folded-hands-near-her-face-looking-aside-smiling-broadly-wearing-casual-clothes-posing_295783-4292.jpg?w=996&t=st=1661803310~exp=1661803910~hmac=74352500120928595fbff5e7a04b880b36ca0c55c18472bfcb76fac9a358d508'),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Hagar ',
                            style: TextStyle(height: 1.3),
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
                        'January 21,2022 at 11 :00 pm ',
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
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.only(end: 5.0),
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
                      padding:
                      const EdgeInsetsDirectional.only(end: 5.0),
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
                      padding:
                      const EdgeInsetsDirectional.only(end: 5.0),
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
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: const DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/nature-colorful-landscape-dusk-cloud_1203-5705.jpg?w=996&t=st=1661805292~exp=1661805892~hmac=d0b30a427919232a9901e686eac90d8151ebb1d0b0993d0faa4fb0cec452b514',
                      ),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0
                      ),
                      child: InkWell(
                        onTap: (){},
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
                              '120',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0
                      ),
                      child: InkWell(
                        onTap: (){},
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
                              '120 comment',
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
              padding: const EdgeInsets.symmetric(
                  vertical: 5.0
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/indoor-portrait-charming-young-woman-with-folded-hands-near-her-face-looking-aside-smiling-broadly-wearing-casual-clothes-posing_295783-4292.jpg?w=996&t=st=1661803310~exp=1661803910~hmac=74352500120928595fbff5e7a04b880b36ca0c55c18472bfcb76fac9a358d508'),
                  ),
                  const SizedBox(width: 8.0,),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Write a comment ..',style: Theme.of(context).textTheme.caption,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 70.0,),
                  const Icon(IconBroken.heart,color: Colors.red,size: 16.0,),
                  const SizedBox(width: 5,),
                  Text('Like',style: Theme.of(context).textTheme.caption,),
                  const SizedBox(width: 20,),
                  const Icon(Icons.share,color: Colors.green,size: 16.0,),
                  const SizedBox(width: 5,),
                  Text('Share',style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10
                  ),),
                ],
              ),
            )
          ],
        ),
      ));
}
