part of '../login.dart';

class _VerifyOTPScene extends StatelessWidget {
  const _VerifyOTPScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return !bloc.state.loading
        ? SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Verifiera',
                      style: TextStyle(
                        color: Color.fromARGB(255, 218, 229, 221),
                        fontSize: 36,
                      )),
                  Center(
                    child: Text(
                      'Ange koden som skickades till :\n${bloc.phoneNumberController.text}',
                      style: const TextStyle(
                        color: SixxColors.secondary,
                      ),
                    ),
                  ),
                  Pinput(
                    controller: bloc.pinController,
                    length: 6,
                    onCompleted: (pin) {
                      if (defaultTargetPlatform != TargetPlatform.windows ||
                          defaultTargetPlatform != TargetPlatform.macOS) {
                        bloc.verifyPinForPhone(context, pin);
                      } else {
                        bloc.verifyPinForWeb(context, pin);
                      }
                    },
                  ),
                ]),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: SixxColors.primary,
            ),
          );
  }
}
