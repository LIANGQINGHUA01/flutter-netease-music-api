export 'package:netease_music_api/src/api/list/bean.dart';
export 'package:netease_music_api/src/api/login/bean.dart';
export 'package:netease_music_api/src/api/user/bean.dart';

const int RET_CODE_OK = 200;
const int RET_CODE_UNKNOW = -233;
const int RET_CODE_CHEATING = -460;
const int RET_CODE_NEED_LOGIN = 301;
const int RET_CODE_ILLEGAL_ARGUMENT = 400;
const int RET_CODE_ILLEGAL_REQUEST = 403;
const int RET_CODE_REQUEST_NOT_FOUNT = 404;
const int RET_CODE_ACCOUNT_NOT_FOUND = 501;
const int RET_CODE_UPDATE_PROFILE_OCCUPY = 505;

const int RET_CODE_CAPTCHA_VERIFY_FAIL = 503;
const int RET_CODE_CAPTCHA_VERIFY_FREQUENTLY = 405;

enum RetCode {
  Ok,
  NeedLogin,
  IllegalArgument,
  IllegalRequest,
  RequestNotFount,
  UnKnow
}

RetCode valueOfCode(int code) {
  switch (code) {
    case RET_CODE_OK:
      return RetCode.Ok;
    case RET_CODE_NEED_LOGIN:
      return RetCode.NeedLogin;
    case RET_CODE_ILLEGAL_ARGUMENT:
      return RetCode.IllegalArgument;
    case RET_CODE_ILLEGAL_REQUEST:
      return RetCode.IllegalRequest;
    case RET_CODE_REQUEST_NOT_FOUNT:
      return RetCode.RequestNotFount;
  }
  return RetCode.UnKnow;
}
