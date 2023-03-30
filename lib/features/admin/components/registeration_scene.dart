part of '../login.dart';

class _RegisterationScene extends StatelessWidget {
  const _RegisterationScene({Key? key, required this.bloc}) : super(key: key);

  final AuthCubit bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Divider(
            height: 30,
          ),
          const Text(
            'Registrera användare',
            style: TextStyle(
              color: SixxColors.secondary,
              fontSize: 20,
            ),
          ),
          const Divider(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              maxLength: 20,
              focusNode: bloc.focusNode,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: SixxColors.secondary),
              cursorColor: SixxColors.secondary,
              controller: bloc.phoneNumberController,
              onChanged: (value) => bloc.validateNumber(),
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
          const Divider(
            height: 20,
          ),
          const Text(
            '-- Eller --',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: SixxColors.secondary,
              fontSize: 20,
            ),
          ),
          if (defaultTargetPlatform == TargetPlatform.iOS)
            AppleAuthButton(
              onPressed: () {},
              style: AuthButtonStyle(
                width: MediaQuery.of(context).size.width * 0.65,
                buttonColor: SixxColors.primary,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: SixxColors.secondary,
                ),
              ),
            ),
          GoogleAuthButton(
            onPressed: () {},
            style: AuthButtonStyle(
              width: MediaQuery.of(context).size.width * 0.65,
              buttonColor: SixxColors.primary,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: SixxColors.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
