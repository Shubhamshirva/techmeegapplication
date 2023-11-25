
import 'package:techmeegapplication/Data/network/networkapi.dart';
import 'package:techmeegapplication/Utils/Common/constant.dart';
import 'package:techmeegapplication/Utils/base_manager.dart';

// GetkycstatusModel? getkycstatusobj;
// create get model



class Kycstatus {
    Future<ResponseData<dynamic>> Getkycstatus() async {
    final response = await NetworkApi().getApi(ApiConstant.Postlogin);
    if (response.status == ResponseStatus.SUCCESS) {
      // getkycstatusobj = GetkycstatusModel.fromJson(response.data);
      // change here also for response
    }
    return response;
  }

}