import 'package:cis_task_2/model.dart';
import 'package:cis_task_2/shared/cubit/app_cubit.dart';
import 'package:cis_task_2/shared/cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';


Widget buildFurnitureCard(context, int index,DataModel model) {
  return Container(
    width: MediaQuery.of(context).size.width / 3 + 30,
    height: MediaQuery.of(context).size.height / 3,
    decoration: BoxDecoration(
      color: Colors.grey[400],
       image: DecorationImage(image: AssetImage(model.images[0]),fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(10)),
  );
}

class CatSelected extends StatelessWidget {

  final Color colour;
  final Color borderColor;
  final Color textColor;
  final String text;



  CatSelected({@required this.colour, @required this.borderColor, @required this.textColor, @required this.text});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
      child: Center(child: Text(text,style: TextStyle(color: textColor,fontSize: height*0.025,fontWeight: FontWeight.w600),),),
      height: height*0.088,
      width: width*0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colour,
        border: Border.all(color: borderColor,width: 1)
      ),
    );
  }
}
class BottomCard extends StatelessWidget {
   final double left;
   final String name;
   final String price;
   final String star;

   BottomCard({
     @required this.left,
     @required this.name,
     @required this.price,
     @required this.star,
   });
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context,state){
        return Padding(
          padding:  EdgeInsets.only(left: left),
          child: Stack(
            children: [
              Positioned(
                  top: height*0.485,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(name,style:

                        TextStyle(color: kPrimaryColor,
                            fontSize: height*0.0245,fontWeight: FontWeight.bold),),

                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(price,style: TextStyle(color: kPrimaryColor,
                                fontSize: height*0.024,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Icon(Icons.star,color: kPrimaryColor,size: height*0.03,),
                                Text(star,style: TextStyle(color: kPrimaryColor,
                                    fontSize: height*0.02,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        )
                      ],),
                    ),
                    width: width*0.38,
                    height: height*0.23,
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(10)

                    ),
                  )
              ),
              Positioned(left: width*0.24,
                top: height*0.47,
                child: Container(
                  child: Center(child: Text('New',style: TextStyle(
                      color: Colors.white,
                      fontSize: height*0.02
                  ),)),
                  width: width*0.13,
                  height: height*0.03,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              Positioned(
                top: height*0.54,
                child: Container(
                  width: width*0.38,
                  height: height*0.23,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assests/1.png'),fit: BoxFit.fill)
                  ),
                ),
              )
            ],
          ),
        );
      },
    );

  }
}

class Colour extends StatelessWidget {
 final Color colour;
 Colour({@required this.colour});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
            child: CircleAvatar(
              radius: height*0.02,
              backgroundColor: Colors.white,
            ),
          ),

        Positioned(
          child: CircleAvatar(
            radius: height*0.018,
            backgroundColor: colour,
          ),
        ),
      ],
    );
  }
}



