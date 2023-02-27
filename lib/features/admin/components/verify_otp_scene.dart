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
                    onCompleted: (pin) async {
                      if (defaultTargetPlatform != TargetPlatform.windows ||
                          defaultTargetPlatform != TargetPlatform.macOS) {
                        final bool ifSuccess =
                            await bloc.verifyPinForPhone(pin);
                        if (ifSuccess) {
                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const LandingScreen()));
                        } else {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(CustomSnackbar.snackBarInvalidPin);
                          bloc.pinController.text = '';
                          BlocProvider.of<AuthCubit>(context)
                              .enteredValidNumber();
                        }
                      } else {
                        final bool isSuccess = await bloc.verifyPinForWeb(pin);
                        if (isSuccess) {
                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const LandingScreen()));
                        } else {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context)
                              .showSnackBar(CustomSnackbar.snackBarInvalidPin);
                          bloc.pinController.text = '';
                          BlocProvider.of<AuthCubit>(context)
                              .enteredValidNumber();
                        }
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
// final _defaultPinTheme = PinTheme(
//   width: 56,
//   height: 56,
//   textStyle: const TextStyle(
//       fontSize: 20,
//       color: Color.fromRGBO(30, 60, 87, 1),
//       fontWeight: FontWeight.w600),
//   decoration: BoxDecoration(
//     border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
//     borderRadius: BorderRadius.circular(20),
//   ),
// );