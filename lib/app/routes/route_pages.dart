import 'package:get/get.dart';
import 'package:iloilocityapp/app/modules/bottomnav/bottomnav_view.dart';
import 'package:iloilocityapp/app/modules/cedula/cedual_app.dart';
import 'package:iloilocityapp/app/modules/cedula/cedula_view.dart';
import 'package:iloilocityapp/app/modules/cedula/cedulaadd/createupdatecedula2_view.dart';
import 'package:iloilocityapp/app/modules/cedula/cedulaadd/createupdatecedula_view.dart';
import 'package:iloilocityapp/app/modules/citizen_qr_code/citizen_id_view.dart';
import 'package:iloilocityapp/app/modules/citizen_qr_code/citizen_qr_code_view.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_create_view.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_details_view.dart';
import 'package:iloilocityapp/app/modules/citizen_report/citizen_report_view.dart';
import 'package:iloilocityapp/app/modules/clearance/clearance_app.dart';
import 'package:iloilocityapp/app/modules/clearance/clearance_view.dart';
import 'package:iloilocityapp/app/modules/clearance/clearanceadd/createupdateclearance_view.dart';
import 'package:iloilocityapp/app/modules/discover/discover_details.dart';
import 'package:iloilocityapp/app/modules/discover/discover_view.dart';
import 'package:iloilocityapp/app/modules/health_center_emr/health_center_emr_details.dart';
import 'package:iloilocityapp/app/modules/health_center_emr/health_center_emr_view.dart';
import 'package:iloilocityapp/app/modules/ease_of_business/ease_of_business_details_view.dart';
import 'package:iloilocityapp/app/modules/ease_of_business/ease_of_business_view.dart';
import 'package:iloilocityapp/app/modules/idrequest/idrequest_app.dart';
import 'package:iloilocityapp/app/modules/idrequest/idrequest_view.dart';
import 'package:iloilocityapp/app/modules/idrequest/idrequestadd/createupdateiqrequest_view.dart';
import 'package:iloilocityapp/app/modules/incident/incidentadd/createupdateincident_view.dart';
import 'package:iloilocityapp/app/modules/incident/incidentreport_app.dart';
import 'package:iloilocityapp/app/modules/incident/incidentreport_view.dart';
import 'package:iloilocityapp/app/modules/incident_report/incident_report_create_view.dart';
import 'package:iloilocityapp/app/modules/incident_report/incident_report_details_view.dart';
import 'package:iloilocityapp/app/modules/incident_report/incident_report_view.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslip_app.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslip_view.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslipadd/createupdateinfo2_view.dart';
import 'package:iloilocityapp/app/modules/infoslip/infoslipadd/createupdateinfo_view.dart';
import 'package:iloilocityapp/app/modules/job_bulletin/job_bulletin_view.dart';
import 'package:iloilocityapp/app/modules/job_bulletin/job_opening_details_view.dart';
import 'package:iloilocityapp/app/modules/login/login_view.dart';
import 'package:iloilocityapp/app/modules/moments/add_moment.dart';
import 'package:iloilocityapp/app/modules/moments/my_moments_details_view.dart';
import 'package:iloilocityapp/app/modules/moments/my_moment_view.dart';
import 'package:iloilocityapp/app/modules/more_electric/bottomelectricnav/bottomelectricnav_view.dart';
import 'package:iloilocityapp/app/modules/more_electric/splashscreen/splashscreen_view.dart';
import 'package:iloilocityapp/app/modules/news_events/news_events_details.dart';
import 'package:iloilocityapp/app/modules/news_events/news_events_view.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_app.dart';
import 'package:iloilocityapp/app/modules/parent/soloparent_view.dart';
import 'package:iloilocityapp/app/modules/parent/soloparentadd/createupdateinfo1_view.dart';
import 'package:iloilocityapp/app/modules/parent/soloparentadd/createupdateinfo2_view.dart';
import 'package:iloilocityapp/app/modules/parent/soloparentadd/createupdateinfo3_view.dart';
import 'package:iloilocityapp/app/modules/privacy_policy/privacy_policy_view.dart';
import 'package:iloilocityapp/app/modules/profile/edit_profile.dart';
import 'package:iloilocityapp/app/modules/profile/forgot_password.dart';
import 'package:iloilocityapp/app/modules/profile/update_password_view.dart';
import 'package:iloilocityapp/app/modules/sign_up/sign_up_view.dart';
import 'package:iloilocityapp/app/modules/splashscreen/splashscreen_view.dart';
import 'package:iloilocityapp/app/modules/terms_condition/terms_condition_view.dart';
import 'package:iloilocityapp/app/routes/route_names.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: '/',
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: '/bottomnav',
      page: () => const BottomNavView(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginView(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpView(),
    ),
    GetPage(
      name: '/soloparent',
      page: () => const SoloParentView(),
    ),
    GetPage(
      name: '/incident',
      page: () => const IncidentReportView(),
    ),
    GetPage(
      name: citizenReport,
      page: () => const CitizenReportView(),
    ),
    GetPage(
      name: citizenReportCreate,
      page: () => CitizenReportCreateView(),
    ),
    GetPage(
      name: citizenReportDetails,
      page: () => CitizenReportDetailsView(),
    ),

    GetPage(
      name: '/idrequest',
      page: () => const IdRequestView(),
    ),
    GetPage(
      name: '/cedula',
      page: () => const CedulaView(),
    ),
    GetPage(
      name: '/clearance',
      page: () => const ClearanceView(),
    ),
    GetPage(
      name: '/infoslip',
      page: () => const InfoSlipView(),
    ),
    GetPage(
      name: '/createupdateinfo1',
      page: () => const CreateUpdateInfoView1(),
    ),
    GetPage(
      name: '/createupdateinfo2',
      page: () => const CreateUpdateInfoView2(),
    ),
    GetPage(
      name: '/createupdateinfo3',
      page: () => const CreateUpdateInfoView3(),
    ),
    GetPage(
      name: '/soloparentapp',
      page: () => const SoloParentApp(),
    ),
    GetPage(
      name: '/createupdateincident',
      page: () => const CreateUpdateIncidentView(),
    ),
    GetPage(
      name: '/incidentreportapp',
      page: () => const IncidentReportApp(),
    ),
    GetPage(
      name: '/createupdateclearance',
      page: () => const CreateUpdateClearanceView(),
    ),
    GetPage(
      name: '/clearanceapp',
      page: () => const ClearanceApp(),
    ),
    GetPage(
      name: '/createupdateidrequest',
      page: () => const CreateUpdateIdRequestView(),
    ),
    GetPage(
      name: '/idrequestapp',
      page: () => const IdRequestApp(),
    ),
    GetPage(
      name: '/createupdateslip',
      page: () => const CreateUpdateInfoSlipView(),
    ),
    GetPage(
      name: '/createupdateslip2',
      page: () => const CreateUpdateInfoSlipView2(),
    ),
    GetPage(
      name: '/infoslipapp',
      page: () => const InfoSlipApp(),
    ),
    GetPage(
      name: '/createupdatecedula',
      page: () => const CreateUpdateCedulaView(),
    ),
    GetPage(
      name: '/createupdatecedula2',
      page: () => const CreateUpdateCedulaView2(),
    ),
    GetPage(
      name: '/cedulatapp',
      page: () => const CedulaApp(),
    ),
    GetPage(
      name: '/editprofile',
      page: () => const EditProfileView(),
    ),
    GetPage(
      name: '/updatepassword',
      page: () => const UpdatePasswordView(),
    ),
    GetPage(
      name: '/privacypolicy',
      page: () => const PrivacyPolicyView(),
    ),
    GetPage(
      name: '/termsconditon',
      page: () => const TermsConditionView(),
    ),
    GetPage(
      name: '/forgotpassword',
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
      name: jobBulletin,
      page: () => const JobBulletinView(),
    ),
    GetPage(
      name: jobOpeningDetails,
      page: () => const JobOpeningDetailsView(),
    ),
    GetPage(
      name: incidentReport,
      page: () => const IncidentRportView(),
    ),
    GetPage(
      name: incidentReportDetails,
      page: () => IncidentReportDetailsView(),
    ),
    GetPage(
      name: '/discover',
      page: () => const DiscoverView(),
    ),
    GetPage(
      name: '/discoverdetails',
      page: () => const DiscoverDetailsView(),
    ),
    GetPage(
      name: '/mymoments',
      page: () => const MyMomentsView(),
    ),
    GetPage(
      name: '/mymomentsdetails',
      page: () => const MyMomentsDetailsView(),
    ),
    GetPage(
      name: '/addmoment',
      page: () => const AddMomentView(),
    ),
    GetPage(
      name: '/healthcenteremr',
      page: () => const HealthCenterEMRView(),
    ),
    GetPage(
      name: '/healthcenteremrdetails',
      page: () => const HealthCenterEMRDetails(),
    ),
    GetPage(
      name: '/newsevents',
      page: () => const NewsEventsView(),
    ),
    GetPage(
      name: '/newseventsdetails',
      page: () => const NewsEventsDetails(),
    ),
    GetPage(
      name: incidentReportCreate,
      page: () => IncidentReportCreateView(),
    ),
    GetPage(
      name: citizenQRCode,
      page: () => CitizenQRCodeView(),
    ),
    GetPage(
      name: viewCitizenID,
      page: () => CitizenIDView(),
    ),
    GetPage(
      name: easeOfBusiness,
      page: () => const EaseOfBusinessView(),
    ),
    GetPage(
      name: easeOfBusinessDetails,
      page: () => EaseOfBusinessDetailsView(),
    ),
    //More Electric
    GetPage(
      name: '/electricsplashscreen',
      page: () => const SplashScreenElectricView(),
    ),
    GetPage(
      name: '/electricbottomnav',
      page: () => const BottomNavElectricView(),
    ),
  ];
}
