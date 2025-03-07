import 'package:go_router/go_router.dart';
import 'package:sandbox/features/pages/resume/resume_page.dart';

GoRoute get resumeRoute => GoRoute(
      path: '/resume',
      builder: (context, state) => ResumePage(),
    );
