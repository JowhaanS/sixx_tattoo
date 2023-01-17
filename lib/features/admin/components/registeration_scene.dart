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
                color: SixxColors.secondary,
                fontSize: 36,
              )),
          SizedBox(
            width: 600,
            child: TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(color: SixxColors.secondary),
              cursorColor: SixxColors.secondary,
              controller: bloc.phoneNumberController,
              onChanged: (value) => bloc.validateNumber(),
              onSubmitted: (value) {
                if (bloc.checkIfPhoneNumberEmpty()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(CustomSnackbar.snackBarPhoneNumberEmpty);
                } else if (bloc.validateNumber() == null) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(CustomSnackbar.snackBarInvalidNumber);
                } else {
                  bloc.enteredValidNumber();
                }
              },
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color: SixxColors.primary,
                ),
                label: Text(
                  'Phonenumber',
                  style: TextStyle(color: SixxColors.primary),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SixxColors.secondary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: SixxColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
