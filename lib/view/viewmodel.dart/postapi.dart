

import 'package:techmeegapplication/Data/network/networkapi.dart';
import 'package:techmeegapplication/Utils/Common/constant.dart';
import 'package:techmeegapplication/Utils/base_manager.dart';

class Postapi {

  Future<ResponseData<dynamic>> Yourpostapiname(updata) async {
    final response =
        await NetworkApi().postApi(url: ApiConstant.soMuchToWatch, data: updata);
    return response;
  }
}