import 'package:get/get.dart';

import 'package:literasi_digital_tuna_netra/app/modules/AboutUs/bindings/about_us_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AboutUs/views/about_us_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AddLiteratur/bindings/add_literatur_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AddLiteratur/views/add_literatur_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AddPengelola/bindings/add_pengelola_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AddPengelola/views/add_pengelola_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AdminHome/bindings/admin_home_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AdminHome/views/admin_home_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ChangePassword/bindings/change_password_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ChangePassword/views/change_password_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/EditLiteratur/bindings/edit_literatur_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/EditLiteratur/views/edit_literatur_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/EditProfile/bindings/edit_profile_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/EditProfile/views/edit_profile_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ForgetPassword/bindings/forget_password_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ForgetPassword/views/forget_password_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Literatur/bindings/literatur_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Literatur/views/literatur_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/LiteraturAdmin/bindings/literatur_admin_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/LiteraturAdmin/views/literatur_admin_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Login/bindings/login_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Login/views/login_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Pengelola/bindings/pengelola_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Pengelola/views/pengelola_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Profile/bindings/profile_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/Profile/views/profile_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ResultOcr/bindings/result_ocr_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ResultOcr/views/result_ocr_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ScanOcr/bindings/scan_ocr_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ScanOcr/views/scan_ocr_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ScanQr/bindings/scan_qr_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/ScanQr/views/scan_qr_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/SplashScreen/bindings/splash_screen_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/SplashScreen/views/splash_screen_view.dart';

import 'package:literasi_digital_tuna_netra/app/modules/home/bindings/home_binding.dart';
import 'package:literasi_digital_tuna_netra/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.LITERATUR,
      page: () => LiteraturView(),
      binding: LiteraturBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR,
      page: () => ScanQrView(),
      binding: ScanQrBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_OCR,
      page: () => ScanOcrView(),
      binding: ScanOcrBinding(),
    ),
    GetPage(
      name: _Paths.ADD_LITERATUR,
      page: () => AddLiteraturView(),
      binding: AddLiteraturBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PENGELOLA,
      page: () => AddPengelolaView(),
      binding: AddPengelolaBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESULT_OCR,
      page: () => ResultOcrView(),
      binding: ResultOcrBinding(),
    ),
    GetPage(
      name: _Paths.LITERATUR_ADMIN,
      page: () => LiteraturAdminView(),
      binding: LiteraturAdminBinding(),
    ),
    GetPage(
      name: _Paths.PENGELOLA,
      page: () => PengelolaView(),
      binding: PengelolaBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_LITERATUR,
      page: () => EditLiteraturView(),
      binding: EditLiteraturBinding(),
    ),
  ];
}
