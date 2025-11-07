import 'package:evote_web/app/utils/app_routes.dart';
import 'package:evote_web/feature/AdminLogin/bloc/admin_bloc.dart';
import 'package:evote_web/feature/AdminLogin/screen/ui/admin_login.dart';
import 'package:evote_web/feature/AdminLogin/screen/ui/admin_portal.dart';
import 'package:evote_web/feature/CandidateList/bloc/candidate_list_bloc.dart';
import 'package:evote_web/feature/CandidateList/screen/ui/candidate_list.dart';
import 'package:evote_web/feature/CandidateReg/bloc/candidate_reg_bloc.dart';
import 'package:evote_web/feature/CandidateReg/screen/ui/candidate_reg.dart';
import 'package:evote_web/feature/CandidateVerify/bloc/cd_verify_bloc.dart';
import 'package:evote_web/feature/CandidateVerify/screen/ui/candidate_verify.dart';
import 'package:evote_web/feature/Home/screen/ui/home_screen.dart';
import 'package:evote_web/app/utils/app_theme.dart';
import 'package:evote_web/feature/Vote/bloc/vote_bloc.dart';
import 'package:evote_web/feature/Vote/screen/ui/vote.dart';
import 'package:evote_web/feature/VoterList/bloc/voter_list_bloc.dart';
import 'package:evote_web/feature/VoterList/screen/ui/voter_list.dart';
import 'package:evote_web/feature/VoterReg/bloc/voter_reg_bloc.dart';
import 'package:evote_web/feature/VoterReg/screen/ui/voter_reg.dart';
import 'package:evote_web/feature/VoterVerify/bloc/vverify_bloc.dart';
import 'package:evote_web/feature/VoterVerify/screen/ui/voter_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Evote extends StatefulWidget {
  const Evote({super.key});

  @override
  State<Evote> createState() => _EvoteState();
}

class _EvoteState extends State<Evote> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(917, 929),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AdminBloc()),
          BlocProvider(create: (context) => VoterRegBloc()),
          BlocProvider(create: (context) => CandidateRegBloc()),
          BlocProvider(create: (context) => VoterListBloc()),
          BlocProvider(create: (context) => CandidateListBloc()),
          BlocProvider(create: (context) => CdVerifyBloc()),
          BlocProvider(create: (context) => VverifyBloc()),
          BlocProvider(create: (context) => VoteBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: _goRouter,
        ),
      ),
    );
  }

  final GoRouter _goRouter = GoRouter(
    initialLocation: AppRoutes.initialRoutePath,
    routes: [
      GoRoute(
        path: AppRoutes.initialRoutePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.adminRoutePath,
        builder: (context, state) => const AdminLogin(),
      ),
      GoRoute(
        path: AppRoutes.candidateListRoutePath,
        builder: (context, state) => const CandidateList(),
      ),
      GoRoute(
        path: AppRoutes.voterListRoutePath,
        builder: (context, state) => const VoterList(),
      ),
      GoRoute(
        path: AppRoutes.candidateRegRoutPath,
        builder: (context, state) => const CandidateReg(),
      ),
      GoRoute(
        path: AppRoutes.voterRegRoutPath,
        builder: (context, state) => const VoterReg(),
      ),
      GoRoute(
        path: AppRoutes.candidateVerifyRoutePath,
        builder: (context, state) => const CandidateVerify(),
      ),
      GoRoute(
        path: AppRoutes.voterVerifyRoutePath,
        builder: (context, state) => const VoterVerify(),
      ),
      GoRoute(
        path: AppRoutes.adminPortalRoutePath,
        builder: (context, state) => const AdminPortal(),
      ),
      GoRoute(
        path: '${AppRoutes.voteRoutePath}/:nid',
        builder: (context, state) {
          final nid = state.pathParameters['nid'] ?? '';
          return Vote(nid: nid);
        },
      ),
    ],
  );
}
