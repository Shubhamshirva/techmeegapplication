

import 'package:techmeegapplication/Data/network/networkapi.dart';
import 'package:techmeegapplication/Utils/Common/constant.dart';
import 'package:techmeegapplication/Utils/base_manager.dart';

class Postapi {

  // var url = "https://business.techmeeg.in/API/MobileAPI.aspx?";

  // Future<ResponseData<dynamic>> Loginpostapi(updata) async {
  //   final response =
  //       await NetworkApi().postApiLogin(url: ApiConstant.baseurl, data: updata);

        
  //                                             Map<String, dynamic> res =
  //                                                 response.data;
  //                                                 print("response is ${res}");
  //   return response;
  // }

  Future<ResponseData<dynamic>> Loginpostapi(updata) async {
  String urlWithParams = ApiConstant.baseurl +
      "?requestType=login" +
      "&username=${updata['username']}" +
      "&password=${updata['password']}" +
      "&SecureID=${updata['SecureID']}" +
      "&UUID=${updata['UUID']}" +
      "&deviceid=${updata['deviceid']}" +
      "&devicename=${updata['devicename']}";

  final response = await NetworkApi().postApiLogin(url: urlWithParams);
  print("url is ${urlWithParams}");

  if (response.data is Map<String, dynamic>) {
    // If the response is a Map<String, dynamic>, handle it as expected
    Map<String, dynamic> responseData = response.data;
    print("response is $responseData");

    return ResponseData<dynamic>("Success", ResponseStatus.SUCCESS, data: responseData);
  } else if (response.data is String) {
    // If the response is a String, handle it as needed
    print("Response is a String: ${response.data}");

    return ResponseData<dynamic>(response.data, ResponseStatus.SUCCESS);
  } else {
    // If the response is of an unexpected type, handle accordingly
    print("Unexpected response type: ${response.data.runtimeType}");

    return ResponseData<dynamic>("Unexpected response type", ResponseStatus.FAILED);
  }
}
  
}