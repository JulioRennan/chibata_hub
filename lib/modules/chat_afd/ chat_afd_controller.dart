import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:chibata_hub/core/domain/entities/afd_entity.dart';
import 'package:chibata_hub/modules/afd/afd_controller.dart';

class ChatAFDController extends GetxController {
  final listAFDs = Get.find<AFDController>().listAfds;
  List<ChatOperation> listChatOperation = [];

  void execString(String strinToProcess) {
    final listSteps = <StepAFDInfo>[];
    bool isBreak = false;
    for (var i = 0; i < strinToProcess.length; i++) {
      final currentStep = getResultByProcess(
        strinToProcess[i],
        i == 0 ? listAFDs.first : listSteps[i - 1].nextStepAFD!,
      );
      listSteps.add(currentStep);
      if (currentStep.nextStepAFD == null) {
        currentStep.isFinal = true;
        isBreak = true;
        break;
      }
    }
    if (!isBreak) {
      final index = strinToProcess.length - 1;
      final currentStep = getResultByProcess(
        strinToProcess[index],
        listSteps[index].nextStepAFD!,
      );
      currentStep.isFinal = true;
      listSteps.add(currentStep);
    }

    final lastStep = listSteps.last;
    lastStep.isFinal = true;

    if (lastStep.stepAFD.isFinal) {
      if (listSteps.length == strinToProcess.length &&
              (lastStep.state == '1' && lastStep.stepAFD.when1 == null) ||
          (lastStep.state == '0' && lastStep.stepAFD.when0 == null)) {
        lastStep.isError = true;
        listSteps.add(
          StepAFDInfo(
            stepAFD: AFDEntity(
              isFinal: false,
              state: -1,
            ),
            state: lastStep.state,
            isFinal: true,
            isError: true,
            nextStepAFD: null,
          ),
        );
        lastStep.isFinal = false;
        lastStep.isError = false;
      } else {
        lastStep.isError = false;
      }
    } else {
      lastStep.isError = true;
    }

    listChatOperation.insert(
      0,
      ChatOperation(
        stringToProcess: strinToProcess,
        listSteps: listSteps,
      ),
    );
    update();
  }
}

StepAFDInfo getResultByProcess(
  String str,
  AFDEntity afd,
) {
  bool isError = false;
  bool isFinal = false;
  AFDEntity? nextStepAFD;
  if (str == '0') {
    if (afd.when0 != null) {
      nextStepAFD = afd.when0;
    } else {
      isError = afd.isFinal ? false : true;
    }
  }
  if (str == '1') {
    if (afd.when1 != null) {
      nextStepAFD = afd.when1;
    } else {
      isError = afd.isFinal ? false : true;
    }
  }

  return StepAFDInfo(
    stepAFD: afd,
    state: str,
    isFinal: isFinal,
    isError: isError,
    nextStepAFD: nextStepAFD,
  );
}

class StepAFDInfo {
  AFDEntity stepAFD;
  String state;
  bool isFinal;
  bool isError;
  AFDEntity? nextStepAFD;

  StepAFDInfo({
    required this.stepAFD,
    required this.state,
    required this.isFinal,
    required this.isError,
    required this.nextStepAFD,
  });

  Map<String, dynamic> toMap() {
    return {
      'stepState': stepAFD.toString(),
      'state': state,
      'isFinal': isFinal,
      'isError': isError,
      'nextStepAFD': nextStepAFD.toString(),
    };
  }

  String toJson() => json.encode(toMap());
}

class ChatOperation {
  ChatOperation({
    required this.stringToProcess,
    required this.listSteps,
  });
  String stringToProcess;
  List<StepAFDInfo> listSteps;
}
