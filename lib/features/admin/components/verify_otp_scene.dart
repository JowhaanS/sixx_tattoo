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
                  Text(
                    'Ange koden som skickades till : ${bloc.phoneNumberController.text}',
                    style: const TextStyle(
                      color: SixxColors.secondary,
                    ),
                  ),
                  Pinput(
                    controller: bloc.pinController,
                    length: 6,
                    onCompleted: (pin) async {
                      final bool isSuccess = await bloc.verifyPin(pin);
                      if (isSuccess) {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const LandingScreen()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(CustomSnackbar.snackBarInvalidPin);
                        bloc.pinController.text = '';
                        BlocProvider.of<AuthCubit>(context)
                            .enteredValidNumber();
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