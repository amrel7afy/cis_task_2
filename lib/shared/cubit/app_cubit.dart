

import 'package:bloc/bloc.dart';
import 'package:cis_task_2/model.dart';

import 'app_states.dart';
enum Selection {chairs,sofa,tables}
class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  List<bool> selection=[false,false,false];
  int currentIndex=0;
  List<DataModel>furnitures=[
    DataModel(name: 'Green Chaire', price: '\$65', star: '4.9', images: ['assests/0.png','assests/1.png','assests/2.png']),
    DataModel(name: 'Grey Chaire', price: '\$88', star: '2.4', images: ['assests/1.png','assests/0.png','assests/2.png']),
    DataModel(name: 'Red Chaire', price: '\$70', star: '6.6', images: ['assests/2.png','assests/1.png','assests/0.png']),
  ];
  Selection selected;
  int counter=03;
  int currentImageIndex=0;

  // void selectItem(index){
  //   selection[currentIndex]=false;
  //   currentIndex=index;
  //   selection[currentIndex]=true;
  //   emit(AppChangeIndexState());
  // }

 void select(Selection currentSelected){
    if(currentSelected==Selection.chairs){
      selected=Selection.chairs;
    }
    else if(currentSelected==Selection.sofa){
      selected=Selection.sofa;
    }
    else{
      selected=Selection.tables;
    }
    emit(AppChangeEnumState());
 }

 void countPlus(){
    if(counter<6){ counter++;}else {counter=counter;}

    emit(AppChangeCountState());
 }
 void countMinus(){
   if(counter>0){ counter--;}else {counter=counter;}
    emit(AppChangeCountState());
 }
void changeImages(index){
   currentImageIndex=index;
  emit(AppChangeImageToggleState());
}
}