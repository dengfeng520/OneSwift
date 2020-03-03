//
//  SocketCode.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

enum CMDCode : UInt32 {
    case CMD_HEART = 0x000A // 心跳
    case CMD_LOGIN = 0x0101 // 登录
    case CMD_EXPLORE = 0x0201 // 探索
    case CMD_CLOSE_EXPLORE = 0x0202 // 结束探索/通话
    case CMD_LIKE_EACH = 0x0301 //喜欢
    case CMD_SENDGIFT = 0x0401 //送礼
    case CMD_REPORT = 0x0501 //举报
    case CMD_REWARD = 0x0601 //获取奖励通知
    case CMD_START_VIDEO = 0x0203 //可以开始视频
    case CMD_COVER_ABOUT = 0x0701 //封号相关
    case CMD_SHOW_FACE = 0x0801 //人脸检测反馈
    case CMD_ARTICLE_CHECK = 0x0901 //动态审核结果通知
    case CMD_SQUARE_MES = 0x0902 //用户点赞评论等，消息通知
}

enum serverCode : UInt32 {
    
    case CODE_LOGIN_SUCCESS = 100  // 登录成功
    case CODE_LOGIN_ERROR = 101  // 登录失败
    case CODE_LOGIN_ALREADY = 102  // 已经登录
    case CODE_LOGIN_FIELD_ERROR = 103  // 字段错误/缺失
    case CODE_LOGIN_RELINK = 104  // 短线重连 新增
    
    case  CODE_EXPLORE_SUCCESS = 200  // 匹配成功
    case  CODE_EXPLORE_ALREADY = 201  // 已经在探索状态
    case  CODE_EXPLORE_OVER = 202  // 探索结束/通话结束
    case CODE_EXPLORE_PENALTY = 203  // 时间惩罚未结束
    case CODE_EXPLORE_PARAMETER_ERROR = 204  // 参数错误
    case  CODE_EXPLORE_FIELD_ERROR = 205  // 字段错误/缺失
    case  CODE_EXPLORE_LOGOUT = 206  // 未登录
    
    //----------------------
    case  CODE_SENDGIFT_SUCCESS = 500  //送礼成功
    case  CODE_SENDGIFT_RECEIVEAGIFT = 501  //收到礼物
    case  CODE_SENDGIFT_MISSING_FIELD = 502  //字段错误/缺失
    case  CODE_SENDGIFT_PARAMETER_ERROR = 503  //参数错误
    case CODE_SENDGIFT_DISTRIBUTION_FAILURE = 504  //礼物派发失败
    case  CODE_SENDGIFT_INSUFFICIENT_VOICE = 505  //虚拟货币不足
    case  CODE_SENDGIFT_GIFTID_ERROR = 506  //礼物ID错误
    
    //----------------------
    case  CODE_REWARD_GOLD = 600  //金币奖励接受成功
    case  CODE_REWARD_LIFEVALUE = 601  // 火力值奖励接受成功
    
    //---------------------- 封号禁言相关Banned
    case CODE_TITLE_RELATED = 700
    case CODE_BANNED_ABOUT = 701
    
    //---------------------- 对方是否露脸
    case  CODE_OTHER_SHOW_FACE = 800
    
    //---------------------- 发送消息
    case CODE_ARTICLE_CHECK = 900  //动态审核结果通知
    case CODE_SQUARE_MES = 901  //用户点赞评论等，消息通知
}
