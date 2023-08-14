import 'package:get/get.dart';

class AppTranslation extends Translations {
  static const textHome = 'text_home';
  static const textAddNew = 'text_add_new';
  static const textLogout = 'text_logout';
  static const textSave = 'text_save';
  static const textCreateUser = 'text_create_cser';
  static const textListUser = 'text_list_user';
  static const textLogin = 'text_login';
  static const textUsername = 'text_username';
  static const textPassword = 'text_password';
  static const textMessageLogin = 'text_message_login';
  static const textFirstName = 'text_first_name';
  static const textLastName = 'text_last_name';
  static const textMale = 'text_male';
  static const textFemale = 'text_female';
  static const textEmail = 'text_email';
  static const textErrorEmpty = 'text_error_empty';
  static const textAddAgent = 'text_add_agent';
  static const textAgentsList = 'text_agents_list';
  static const textGender = 'text_gender';

  @override
  Map<String, Map<String, String>> get keys => {
    'id_ID': {
      textHome: 'Home',
      textAddNew: 'Add New',
      textLogout: 'Logout',
      textSave: 'Save',
      textCreateUser: 'Create User',
      textListUser: 'List User',
      textLogin: 'Login',
      textUsername: 'Username',
      textPassword: 'Password',
      textMessageLogin: 'Silahkan login gunakan username dan password',
      textFirstName: 'First Name',
      textLastName: 'Last Name',
      textMale: 'Male',
      textFemale: 'Female',
      textEmail: 'Email',
      textErrorEmpty: '@fieldName harus diisi',
      textAddAgent: 'Add Agent',
      textAgentsList: 'Agents List',
      textGender: 'Gender',
    }
  };
}
