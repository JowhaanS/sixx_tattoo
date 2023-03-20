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
                fontSize: 20,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              maxLength: 20,
              focusNode: bloc.focusNode,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: SixxColors.secondary),
              cursorColor: SixxColors.secondary,
              controller: bloc.phoneNumberController,
              onChanged: (value) => bloc.validateNumber(),
              onEditingComplete: () {
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
