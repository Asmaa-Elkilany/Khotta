

import 'package:flutter/material.dart';
import 'package:task_management/colors/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:get/get.dart';
import '../widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myDate=[
      "Try harder",
      "Try smarter"
    ];
    final leftEditingIcon=Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child:
      const Icon(
       Icons.edit,
       color: Colors.white,
      )
    );
    final rightDeletingIcon=Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child:
        const Icon(
          Icons.delete,
          color: Colors.white,
        )
    );
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/header1.jpg")
                )
            ),
              child:  InkWell(
                onTap:(){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back,color: AppColors.secondaryColor),
              )
          ),
          Container(
            margin: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: [
                const Icon(Icons.home,color: AppColors.secondaryColor),
                const SizedBox(width: 10),
                Container(
                  width: 25,
                    height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black
                  ),
                  child:const Icon(Icons.add,color:Colors.white,size: 22),
                ),
                Expanded(child: Container()),
                const Icon(Icons.calendar_month,color: AppColors.secondaryColor),
                const SizedBox(width: 10),
                const Text(
                  "2",
                  style:TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(itemCount: myDate.length,
                itemBuilder: (context, index){
             return Dismissible(
               background: leftEditingIcon,
               secondaryBackground: rightDeletingIcon,
               onDismissed: (DismissDirection direction){
                print("After Dismiss");
               },
               confirmDismiss: (DismissDirection direction) async {
                 if(direction == DismissDirection.startToEnd){
                   showModalBottomSheet(
                       backgroundColor:Colors.transparent,
                       barrierColor: Colors.transparent,
                       context: context,
                       builder:(_){
                       return Container(
                         decoration: BoxDecoration(
                           color: const Color(0xFF2e3253).withOpacity(0.4),
                           borderRadius: const BorderRadius.only(
                             topLeft: Radius.circular(10),
                             topRight: Radius.circular(10)
                           )
                         ),
                         height: 550,
                         child:const Padding(
                           padding: EdgeInsets.only(left: 20, right: 20),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               ButtonWidget(backgroundColor:AppColors.mainColor ,
                                   text:"View",
                                   textColor:Colors.white ),
                               SizedBox(height: 20,),

                               ButtonWidget(backgroundColor:AppColors.mainColor ,
                                   text:"Edit",
                                   textColor:AppColors.secondaryColor )
                             ],
                           ),
                         )
                       );

                       });
                   return false;
                 } else {
                   return Future.delayed(const Duration(seconds: 1),
                   ()=>direction ==DismissDirection.endToStart);
                 }
               },
               key: ObjectKey(index),
               child: Container(
                 margin: const EdgeInsets.only(left: 20, right: 20,bottom: 10),
                 child: TaskWidget(
                  text:myDate[index],
                   color: Colors.blueGrey,
                           
                 ),
               ),
             ) ;
            }
            ),
          )],
      ),
    );
  }
}
