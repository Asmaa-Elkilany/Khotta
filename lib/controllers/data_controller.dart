import 'package:task_management/services/service.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  DateService service = DateService();
  bool _isLoading =false;
  bool get isLoading=>_isLoading;
  List<dynamic> _myData=[];
  List<dynamic> get myDate=>_myData;
  Future<void> getData() async{
    _isLoading =true;
   Response response= await service.getData();
   if(response.statusCode==200){
    _myData=response.body;
    print("we got the data");
    update();
   } else{
     print("we did not get any data");
   }
  }
}