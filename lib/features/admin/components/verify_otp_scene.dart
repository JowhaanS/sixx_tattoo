part of '../login.dart';

class _VerifyOTPScene extends StatelessWidget {
  const _VerifyOTPScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text('Verifiera',
              style: TextStyle(
                color: Color.fromARGB(255, 218, 229, 221),
                fontSize: 36,
              )),
          Pinput(
            length: 6,
          ),
        ],
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