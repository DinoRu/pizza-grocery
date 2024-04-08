part of 'sign_up_bloc.dart';


sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class SignUpRequired extends SignUpEvent {
  final MyUser myUser;
  final String password;

  const SignUpRequired(this.password, this.myUser);


}
