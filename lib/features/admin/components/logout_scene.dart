part of '../login.dart';

class _LogoutScene extends StatelessWidget {
  const _LogoutScene({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Är du säker?',
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                bloc.signOut();
                Navigator.of(context).pop();
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: SixxColors.primary),
              child: const Text(
                'Logga ut',
                style: TextStyle(
                  color: SixxColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
