import 'package:flutter_modular/flutter_modular.dart';
import 'package:stock_control/src/feature/home/view/page/singuppage.dart';
import '../home/viewmodel/home_viewmodel.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => SignupPage()),
      ];
}
