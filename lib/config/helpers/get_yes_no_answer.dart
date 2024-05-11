

import 'package:dio/dio.dart';
import 'package:stunet/domain/entities/message.dart';
import 'package:stunet/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yesno.wtf/api');
    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }

}