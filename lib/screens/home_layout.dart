

import 'package:cis_task_2/constants.dart';
import 'package:cis_task_2/model.dart';
import 'package:cis_task_2/screens/second_screen.dart';
import 'package:cis_task_2/shared/cubit/app_cubit.dart';
import 'package:cis_task_2/shared/cubit/app_states.dart';
import 'package:cis_task_2/shared/reusable_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayout extends StatelessWidget {
   HomeLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = BlocProvider.of(context);
        return Scaffold(
            body: SafeArea(
              child: Container(
          child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3 + 50,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                              40,
                            ),
                            bottomLeft: Radius.circular(40))),
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.menu,
                              size: height*0.05,
                            ),
                            Expanded(child: SizedBox()),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(Icons.search, size:  height*0.05),
                              ],
                            ),
                            SizedBox(
                              width:  height*0.01,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 10,
                              height: MediaQuery.of(context).size.height / 17,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://th.bing.com/th/id/R.c3def1fb4d0d6f02f32fc20986f0bed6?rik=zWFcM73pfDAEdw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_215059.png&ehk=cpnJPsuf6lEHd7fyViQDbBmwZZJgbettb1OKxGirwRA%3d&risl=&pid=ImgRaw&r=0')),
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width:  height*0.02,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 23,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Explore',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:  height*0.04,
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.grey, blurRadius: 20)
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 20,top: MediaQuery.of(context).size.height/6+10),
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height/3,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index)=>GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(models: cubit.furnitures[index])));
                                  },
                                  child: buildFurnitureCard(context,index,cubit.furnitures[index])),
                                separatorBuilder: (context,index)=>SizedBox(width:  height*0.04,),
                                itemCount: 3,scrollDirection: Axis.horizontal,),
                          )),

                      Stack(
                        children: [
                          Positioned(
                            top: height*0.37,
                            right: width*0.02,
                            child:
                            // Container(
                            //   height: 200,
                            //   child: ListView.separated(
                            //     physics: NeverScrollableScrollPhysics(),
                            //       itemBuilder: (context,index)=>CatSelected(colour: Colors.grey),
                            //       separatorBuilder: (context,index)=>SizedBox(width: width*0.02,),
                            //       itemCount: 3),
                            // )
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                 //   cubit.selectItem(0);
                                    cubit.select(Selection.chairs);
                                  },
                                    child: CatSelected(
                                      //colour: cubit.selection[0]==true?kPrimaryColor:Colors.white,
                                      colour: cubit.selected==Selection.chairs?kPrimaryColor:Colors.white,
                                      borderColor: cubit.selected==Selection.chairs?kBackgroundColor:Colors.grey,
                                      text: 'Chairs',
                                      textColor: cubit.selected==Selection.chairs?Colors.white:Colors.grey,

                                    )),
                                SizedBox(width: width*0.02,),
                                GestureDetector(
                                    onTap: (){
                                   //   cubit.selectItem(1);
                                      cubit.select(Selection.sofa);
                                    },
                                    child: CatSelected(
                                      //colour: cubit.selection[1]==true?kPrimaryColor:Colors.white,
                                      colour: cubit.selected==Selection.sofa?kPrimaryColor:Colors.white,
                                      borderColor: cubit.selected==Selection.sofa?kBackgroundColor:Colors.grey,
                                      text:'Sofa',
                                      textColor: cubit.selected==Selection.sofa?Colors.white:Colors.grey,

                                    )),
                                SizedBox(width: width*0.02,),
                                GestureDetector(
                                    onTap: (){
                                     // cubit.selectItem(2);
                                       cubit.select(Selection.tables);
                                    },
                                    child: CatSelected(
                                     // colour: cubit.selection[2]==true?kPrimaryColor:Colors.white,
                                      colour: cubit.selected==Selection.tables?kPrimaryColor:Colors.white,
                                      borderColor: cubit.selected==Selection.tables?kBackgroundColor:Colors.grey,
                                      text: 'Tables',
                                      textColor: cubit.selected==Selection.tables?Colors.white:Colors.grey,


                                    )),
                              ],
                            ),
                          ),

                        ],
                      ),
                      BottomCard(left: 0, name:'Green Chaire', price: '\$4.9', star: '4.9'),
                      BottomCard(left: width*0.5, name: 'Grey Chaire', price: '\$88', star: '2.4'),



                    ],
                  ),
                ),

              ],

          ),
        ),
            ));
      },
    );
  }
}
