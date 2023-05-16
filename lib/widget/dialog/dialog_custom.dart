import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

typedef MyCallbackFuncResponseDialog = Function(DialogResponse);

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final MyCallbackFuncResponseDialog completer;
  const BasicDialog({Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: _BasicDialogContent(request: request, completer: completer));
  }
}

/// The type of dialog to show
enum DialogType { basic }

enum BasicDialogStatus { success, error, warning }

const Color kcRedColor = Color.fromARGB(255, 200, 63, 53);
const Color kcOrangeColor = Color.fromARGB(255, 208, 125, 0);
const Color kcGreenColor = Color.fromARGB(255, 1, 218, 26);
const Color kcPrimaryColor = Color.fromARGB(255, 29, 1, 215);

class _BasicDialogContent extends StatelessWidget {
  const _BasicDialogContent({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse dialogResponse) completer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              // horizontal: screenWidthPercentage(context, percentage: 0.04),
              ),
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // verticalSpaceSmall,
              // BoxText.subheading(
              //   request.title ?? '',
              //   align: TextAlign.center,
              // ),
              // verticalSpaceSmall,
              // BoxText.body(
              //   request.description ?? '',
              //   align: TextAlign.center,
              // ),
              // verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // if (request.secondaryButtonTitle != null)
                  //   TextButton(
                  //     onPressed: () =>
                  //         completer(DialogResponse(confirmed: false)),
                  //     child: Container()
                  //   ),
                  TextButton(
                      onPressed: () =>
                          completer(DialogResponse(confirmed: true)),
                      child: Container(),
                    // child: BoxText.body(
                    //   request.mainButtonTitle ?? '',
                    //   color: kcPrimaryColor,
                    // ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Color _getStatusColor(BasicDialogStatus customDatais) {
    if (customDatais is BasicDialogStatus)
      switch (customDatais) {
        case BasicDialogStatus.error:
          return kcRedColor;
        case BasicDialogStatus.warning:
          return kcOrangeColor;
        case BasicDialogStatus.success:
          return kcGreenColor;
        default:
          return kcPrimaryColor;
      }
    else {
      return kcPrimaryColor;
    }
  }

  IconData _getStatusIcon(dynamic regionDialogStatus) {
    if (regionDialogStatus is BasicDialogStatus)
      switch (regionDialogStatus) {
        case BasicDialogStatus.error:
          return Icons.close;
        case BasicDialogStatus.warning:
          return Icons.warning_amber;
        case BasicDialogStatus.success:
          return Icons.confirmation_num;
        default:
          return Icons.check;
      }
    else {
      return Icons.check;
    }
  }
}
