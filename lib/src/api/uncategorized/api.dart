import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netease_music_api/src/api/bean.dart';
import 'package:netease_music_api/src/api/uncategorized/bean.dart';
import 'package:netease_music_api/src/dio_ext.dart';
import 'package:netease_music_api/src/netease_handler.dart';

mixin ApiUncategorized {
  /// 首页轮播图
  /// [clientType] pc android iphone ipad
  Future<BannerListWrap> homeBannerList({String clientType = 'android'}) {
    var params = {'clientType': clientType};
    return Https.dio
        .postUri(joinUri('/api/v2/banner/get'),
            data: params,
            options: joinOptions(encryptType: EncryptType.LinuxForward))
        .then((Response value) {
      return BannerListWrap.fromJson(value.data);
    });
  }

  /// 国家编码列表
  Future<CountriesCodeListWrap> countriesCodeList() {
    return Https.dio
        .postUri(
            Uri.parse('http://interface3.music.163.com/eapi/lbs/countries/v1'),
            data: {},
            options: joinOptions(
                encryptType: EncryptType.EApi,
                eApiUrl: '/api/lbs/countries/v1'))
        .then((Response value) {
      return CountriesCodeListWrap.fromJson(value.data);
    });
  }

  /// 独家放送推荐
  Future<PersonalizedPrivateContentListWrap> personalizedPrivateContent() {
    return Https.dio
        .postUri(joinUri('/weapi/personalized/privatecontent'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return PersonalizedPrivateContentListWrap.fromJson(value.data);
    });
  }

  /// 独家放送列表
  Future<PersonalizedPrivateContentListWrap> personalizedPrivateContentList(
      {int offset = 0, int limit = 60, bool total = true}) {
    var params = {'total': total, 'limit': limit, 'offset': offset};
    return Https.dio
        .postUri(joinUri('/api/v2/privatecontent/list'),
            data: params, options: joinOptions())
        .then((Response value) {
      return PersonalizedPrivateContentListWrap.fromJson(value.data);
    });
  }

  /// 所有榜单内容摘要
  Future<TopListWrap> topList() {
    return Https.dio
        .postUri(joinUri('/api/toplist'),
            data: {},
            options: joinOptions(encryptType: EncryptType.LinuxForward))
        .then((Response value) {
      return TopListWrap.fromJson(value.data);
    });
  }

  /// 所有榜单详情
  Future<TopListDetailWrap> topListDetail() {
    return Https.dio
        .postUri(joinUri('/weapi/toplist/detail'),
            data: {}, options: joinOptions())
        .then((Response value) {
      return TopListDetailWrap.fromJson(value.data);
    });
  }

  /// batch批量请求接口
  /// 登陆后调用此接口 ,传入接口和对应原始参数(原始参数非文档里写的参数,需参考源码),可批量请求接口
  Future<Object> batchApi(Map<String, String> apis) {
    Map<String, dynamic> params = {'e_r': true};
    apis.forEach((key, value) {
      params[key] = value;
    });
    return Https.dio
        .postUri(joinUri('/eapi/batch'),
            data: params,
            options: joinOptions(
                encryptType: EncryptType.EApi, eApiUrl: '/api/batch'))
        .then((Response value) {
      return value.data;
    });
  }

  /// 操作记录
  /// [action] 'play'
  Future<ServerStatusBean> weblog(
      String id, String sourceId, String action, String type, String end,
      {int download = 0, int wifi = 0, int time = 0}) {
    var params = {
      'logs': jsonEncode([
        {
          'action': action,
          'json': {
            'download': download,
            'end': end,
            'id': id,
            'sourceId': sourceId,
            'time': time,
            'type': type,
            'wifi': wifi,
          }
        }
      ])
    };
    return Https.dio
        .postUri(joinUri('/weapi/feedback/weblog'),
            data: params, options: joinOptions())
        .then((Response value) {
      return ServerStatusBean.fromJson(value.data);
    });
  }
}
