import 'package:chibata_hub/core/domain/entities/afd_entity.dart';
import 'package:get/get.dart';

class AFDController extends GetxController {
  List<AFDEntity> listAfds = [];
  int count = 0;

  void addAFD() {
    listAfds.add(
      AFDEntity(
        isFinal: false,
        state: count,
      ),
    );
    count++;
    update();
  }

  void removeAFD(AFDEntity afd) {
    listAfds.removeWhere(
      (element) => element.state == afd.state,
    );
    listAfds.forEach(
      (element) {
        if (element.when0?.state == afd.state) element.when0 = null;
        if (element.when1?.state == afd.state) element.when1 = null;
      },
    );
    update();
  }

  void setStateString({
    required AFDEntity afd,
    required AFDEntity afdDestiny,
    required String state,
  }) {
    if (state == '0') {
      afd.when0 = afdDestiny;
    } else {
      afd.when1 = afdDestiny;
    }
    update();
  }
}
