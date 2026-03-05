import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/core/utils/navigation/router_path.dart' show RouterPath;
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutDialog({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) =>
            SignUpBloc(isReminder: false, authRepositoryImpl: context.read<
                AuthRepositoryImpl>()),
        child: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
           if(state is SuccessLogoutState){
             context.pop();
           }
          },
          builder: (context,state){
            return  Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.logout, size: 40, color: Colors.red),
                    const SizedBox(height: 15),

                    Text(
                      S.of(context).logout,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      S.of(context).logoutConfirmation,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ColorManager.lightBlue),
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(S.of(context).cancel),
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (state is LoadingLogoutState)
                          const Expanded(child: Center(child: AnimatedLoader()))
                        else
                          Expanded(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    PreferenceManager().deleteToken();
                                    context.pushReplacementNamed(RouterPath.login);
                                  },
                                  child: Text(S.of(context).logout,style:TextStyle(color: ColorManager.lightBlue),),
                                ),
                                if (state is ErrorLogoutState)
                                  Text(
                                    state.error,
                                    style: TextStyle(color: ColorManager.red),
                                  )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}