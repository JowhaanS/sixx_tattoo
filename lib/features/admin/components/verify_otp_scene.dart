part of '../login.dart';

class _VerifyOTPScene extends StatelessWidget {
  const _VerifyOTPScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Verify'),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.4,
        child: const Pinput(
          length: 6,
        ),
      ),
    ]);
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