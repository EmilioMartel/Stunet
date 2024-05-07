import 'package:flutter_dotenv/flutter_dotenv.dart';



class Environment {

  static String appName = dotenv.env['NAME'] ?? 'La app no tiene nombre';


}