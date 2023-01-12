part of '../login.dart';

class _RegisterationScene extends StatelessWidget {
  const _RegisterationScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [
      Center(
        child: Text('LOGIN',
            style: TextStyle(
              color: Color.fromARGB(255, 218, 229, 221),
              fontSize: 36,
            )),
      ),
    ]);
  }
}
