export type MeetingControlTone = 'primary' | 'strong' | 'normal' | 'muted';

export class MeetingControl {
  id: string = '';
  label: string = '';
  description: string = '';
  tone: MeetingControlTone = 'normal';

  constructor(id: string, label: string, description: string, tone: MeetingControlTone) {
    this.id = id;
    this.label = label;
    this.description = description;
    this.tone = tone;
  }
}

export interface MeetingSceneConfig {
  title: string;
  subtitle: string;
  pageId: string;
  toolbarId: string;
  sliderId: string;
  widthLabel: string;
  controls: MeetingControl[];
}

export const MEETING_SCENE: MeetingSceneConfig = {
  title: '项目周会',
  subtitle: '32 人参会 · 主持人正在共享屏幕',
  pageId: 'meeting-page',
  toolbarId: 'meeting-toolbar',
  sliderId: 'meeting-slider',
  widthLabel: '会议控制条宽度',
  controls: [
    new MeetingControl('mute', '静音', '关闭或开启麦克风', 'primary'),
    new MeetingControl('camera', '摄像头', '关闭或开启摄像头', 'strong'),
    new MeetingControl('share-screen', '共享屏幕', '开始共享屏幕', 'normal'),
    new MeetingControl('members', '成员', '查看参会成员', 'normal'),
    new MeetingControl('chat', '聊天', '打开会议聊天', 'muted'),
    new MeetingControl('record', '录制', '查看会议录制', 'muted'),
    new MeetingControl('hand', '举手', '举手发言', 'muted'),
    new MeetingControl('board', '白板', '打开协作白板', 'muted'),
    new MeetingControl('subtitle', '字幕', '开启实时字幕', 'muted'),
    new MeetingControl('poll', '投票', '发起会议投票', 'muted'),
    new MeetingControl('reaction', '回应', '发送会议回应', 'muted'),
    new MeetingControl('layout', '布局', '切换会议布局', 'muted'),
    new MeetingControl('invite', '邀请', '邀请参会成员', 'muted'),
    new MeetingControl('settings', '设置', '打开会议设置', 'muted'),
    new MeetingControl('minutes', '纪要', '生成会议纪要', 'muted'),
    new MeetingControl('files', '文件', '查看会议文件', 'muted'),
    new MeetingControl('transcript', '转写', '查看实时转写', 'muted'),
    new MeetingControl('translation', '翻译', '开启同声翻译', 'muted'),
    new MeetingControl('focus', '聚焦', '聚焦当前发言人', 'muted'),
    new MeetingControl('timer', '计时', '打开会议计时器', 'muted'),
    new MeetingControl('live', '直播', '管理会议直播', 'muted'),
    new MeetingControl('breakout', '分组', '进入分组讨论', 'muted'),
    new MeetingControl('host-tools', '主持工具', '打开主持工具', 'muted'),
    new MeetingControl('speaker-list', '发言列表', '查看发言列表', 'muted'),
    new MeetingControl('attendance', '签到', '查看参会签到', 'muted'),
    new MeetingControl('cohost', '联席主持', '设置联席主持', 'muted'),
    new MeetingControl('watermark', '水印', '开启屏幕水印', 'muted'),
    new MeetingControl('network', '网络', '查看网络状态', 'muted'),
    new MeetingControl('audio-mode', '音频模式', '切换音频模式', 'muted'),
    new MeetingControl('help', '帮助', '查看会议帮助', 'muted')
  ]
};
