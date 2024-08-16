import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/functions/validinput.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/data/models/user.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_auth_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_button_auth.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_form.dart';
import 'package:freelance_job_portal/features/auth/presentation/views/widget/custom_text_signup.dart';
import 'package:go_router/go_router.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthCodeSent) {
          GoRouter.of(context).push("/verificationsignup");
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Form(
            key: _formKey,
            child: ListView(
              children: [
                const VirticalSpace(5),
                const Center(child: CustomAuthTitle(text: "إنشاء حساب جديد")),
                Image.asset(
                  'assets/images/signup.png',
                  height: SizeConfig.defaultSize! * 10,
                  width: SizeConfig.defaultSize! * 10,
                  fit: BoxFit.contain,
                ),
                const Center(
                    child: CustomTitle(text: "مرحبًا بك في عالم الفرص!")),
                const VirticalSpace(2),
                Center(
                  child: Text(
                    style: Theme.of(context).textTheme.bodyLarge!,
                    textAlign: TextAlign.center,
                    "ابدأ الآن وانضم إلى مجتمعنا من المستقلين وأصحاب المشاريع.",
                  ),
                ),
                const VirticalSpace(6),
                Row(children: [
                  Expanded(
                    child: CustomTextForm(
                      mycontroller: _firstNameController,
                      hinttext: "",
                      lable: "الاسم",
                      icon: Icons.person_2_outlined,
                      isNumber: false,
                      valid: (p0) {
                        return validInput(p0!, 1, 30, "firstname");
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextForm(
                      mycontroller: _lastNameController,
                      hinttext: "",
                      lable: "الكنية",
                      icon: Icons.person_2_outlined,
                      isNumber: false,
                      valid: (p0) {
                        return validInput(p0!, 1, 30, "lastname");
                      },
                    ),
                  ),
                ]),
                CustomTextForm(
                  mycontroller: _phoneController,
                  hinttext: "ادخل رقم هاتفك",
                  lable: "رقم الهاتف",
                  icon: Icons.phone_android_outlined,
                  isNumber: true,
                  valid: (p0) {
                    return validInput(p0!, 10, 15, "phonenumber");
                  },
                ),
                CustomTextForm(
                  mycontroller: _emailController,
                  hinttext: "ادخل ايملك",
                  lable: "الايميل",
                  icon: Icons.email_outlined,
                  isNumber: false,
                  valid: (email) {
                    return validInput(email!, 5, 30, "email");
                  },
                ),
                CustomTextForm(
                  mycontroller: _passwordController,
                  hinttext: "ادخل كلمة المرور",
                  lable: "كلمة المرور",
                  obs: true,
                  icon: Icons.lock_outline,
                  isNumber: false,
                  valid: (password) {
                    return validInput(password!, 8, 32, "password");
                  },
                ),
                const VirticalSpace(3),
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = User(
                          firstname: _firstNameController.text,
                          lastname: _lastNameController.text,
                          phone: _phoneController.text,
                          email: _emailController.text,
                        );
                        context.read<AuthBloc>().add(RegisterEvent(
                              user: user,
                              password: _passwordController.text,
                            ));
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textcolor: Colors.white,
                    text: "انشاء الحساب",
                    borderSide: const BorderSide(width: 0),
                    width: SizeConfig.defaultSize! * 2),
                const VirticalSpace(1),
                TextSignUp(
                  text1: "هل لديك حساب حقأ ؟ ",
                  text2: "اذهب لتسجيل الدخول",
                  onTap: () {
                    GoRouter.of(context).push("/login");
                  },
                )
              ],
            ));
      },
    );
  }
}
