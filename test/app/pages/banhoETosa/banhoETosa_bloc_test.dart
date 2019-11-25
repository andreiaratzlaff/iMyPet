import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_bloc.dart';
import 'package:iMyPet/app/pages/banhoETosa/banhoETosa_module.dart';

void main() {
  initModule(BanhoETosaModule());
  BanhoETosaBloc bloc;

  setUp(() {
    bloc = BanhoETosaModule.to.bloc<BanhoETosaBloc>();
  });

  group('CarteiravacinaBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<BanhoETosaBloc>());
    });
  });
}
