part of '../login.dart';

class _RegisterationScene extends StatelessWidget {
  const _RegisterationScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Registrera användare',
              style: TextStyle(
                color: Color.fromARGB(255, 218, 229, 221),
                fontSize: 36,
              )),
          TextField(
            controller: bloc.phoneNumberController,
            onChanged: (value) => bloc.validateNumber(),
            onSubmitted: (value) {
              if (bloc.checkIfPhoneNumberEmpty()) {
              } else if (bloc.validateNumber() == null) {
              } else {
                bloc.enteredValidNumber();
              }
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              label: Text('Phonenumber'),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
