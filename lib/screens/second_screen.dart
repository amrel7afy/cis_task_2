import 'package:cis_task_2/constants.dart';
import 'package:cis_task_2/shared/cubit/app_cubit.dart';
import 'package:cis_task_2/shared/cubit/app_states.dart';
import 'package:cis_task_2/shared/reusable_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model.dart';

class SecondScreen extends StatelessWidget {
final DataModel models;
SecondScreen({@required this.models});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(builder: (context,state){
      double height=MediaQuery.of(context).size.height;
      double width=MediaQuery.of(context).size.width;
      TextStyle kSecondScreenStyle=  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: MediaQuery.of(context).size.height*0.032);
      AppCubit cubit=BlocProvider.of(context);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sofa',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: height*0.04),),
          backgroundColor: kBackgroundColor,
          elevation: 0,
          actions: [Icon(Icons.shopping_bag_rounded,color: kPrimaryColor,size: height*0.05,)],
          leading: GestureDetector(onTap: (){
            Navigator.pop(context);
          },child: Icon(Icons.arrow_back,color: kPrimaryColor,size: height*0.045,)),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15,right: 15,top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(models.images[cubit.currentImageIndex]),fit: BoxFit.cover)
                ),
              ),
              SizedBox(height: height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Blue Sofa ',style: kSecondScreenStyle,),
                Text('\$65 ',style: kSecondScreenStyle,),
              ],),
              SizedBox(height: height*0.018,),
              Text('This is text can be changed'
                  ' This is text can be changed,'
                  'This is text can be changed This is text can be changed,'
                  'This is text can be changed This is text can be changed.'
                ,style: TextStyle(color: Colors.grey[400],fontSize: height*0.028),),
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Text('Color ',style: kSecondScreenStyle,),
                  SizedBox(width: width*0.02,),
                  Container(
                    height: height*0.04,
                   width: width*0.5,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,

                        itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                            cubit.changeImages(index);
                          },
                          child: Colour(colour: colors[index],));
                    },
                        separatorBuilder: (context,index)=>SizedBox(width: 5,),
                        itemCount: colors.length),
                  ),

                ],
              ),
              SizedBox(height: height*0.03,),
              Row(
                children: [
                  Text('Quantity ',style: kSecondScreenStyle,),
                  SizedBox(width: 15,),
                  Container(
                    padding: EdgeInsets.all(3),
                    width: width*0.36,
                    height: height*0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kSecondaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            cubit.countPlus();
                          },
                          child: CircleAvatar(backgroundColor: kPrimaryColor,
                            radius: height*0.04,
                            child: Center(
                              child: Icon(Icons.add,color: Colors.white,),
                            ),
                          ),
                        ),
                        Text('${cubit.counter}',style: TextStyle(fontSize: height*0.04,fontWeight: FontWeight.bold),),
                        GestureDetector(
                          onTap: (){
                            cubit.countMinus();
                          },
                          child: CircleAvatar(backgroundColor: kPrimaryColor,
                            radius: height*0.04,
                            child: Center(
                              child: Icon(Icons.minimize,color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: height*0.03,),
              Container(
                child: Center(child: Text('Add to cart',style: kSecondScreenStyle,)),
                width: width*0.55,
                height: height*0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kSecondaryColor
                ),
              ),
              SizedBox(height: height*0.02,),
              Container(
                child: Center(child: Text('Add to cart',style: kSecondScreenStyle,)),
                width: width*0.55,
                height: height*0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryColor
                ),
              ),
            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
