export type TripNodeTone = 'primary' | 'strong' | 'normal' | 'muted';

export class TripNode {
  id: string = '';
  label: string = '';
  description: string = '';
  tone: TripNodeTone = 'normal';

  constructor(id: string, label: string, description: string, tone: TripNodeTone) {
    this.id = id;
    this.label = label;
    this.description = description;
    this.tone = tone;
  }
}

export interface TripSceneConfig {
  title: string;
  subtitle: string;
  pageId: string;
  trackId: string;
  sliderId: string;
  widthLabel: string;
  nodes: TripNode[];
}

export const TRIP_SCENE: TripSceneConfig = {
  title: '上海虹桥 → 北京首都',
  subtitle: '当前：前往登机口 · 预计 18 分钟后登机',
  pageId: 'trip-page',
  trackId: 'trip-progress',
  sliderId: 'trip-slider',
  widthLabel: '行程进度条宽度',
  nodes: [
    new TripNode('security', '安检', '完成安检', 'normal'),
    new TripNode('gate', '登机口', '当前前往登机口', 'primary'),
    new TripNode('boarding', '登机中', '下一步开始登机', 'strong'),
    new TripNode('cabin', '客舱', '登机后进入客舱', 'normal'),
    new TripNode('destination', '到达地', '到达北京首都', 'muted'),
    new TripNode('baggage', '行李提取', '到达后提取行李', 'muted'),
    new TripNode('checkin', '值机', '完成值机手续', 'normal'),
    new TripNode('parking', '停车', '到达机场停车区', 'muted'),
    new TripNode('shop', '购物', '候机区购物', 'muted'),
    new TripNode('lounge', '休息室', '进入休息室', 'muted'),
    new TripNode('pickup', '接机', '到达后接机', 'muted'),
    new TripNode('taxi', '打车', '预估打车时间', 'muted'),
    new TripNode('metro', '地铁', '查看地铁接驳', 'muted'),
    new TripNode('hotel', '酒店', '同步酒店信息', 'muted'),
    new TripNode('checkin-hotel', '入住', '到店办理入住', 'muted'),
    new TripNode('receipt', '发票', '管理行程发票', 'muted'),
    new TripNode('weather', '天气', '查看到达地天气', 'muted'),
    new TripNode('service-map', '服务地图', '打开机场服务地图', 'muted'),
    new TripNode('delay-notice', '延误通知', '订阅延误通知', 'muted'),
    new TripNode('meal', '用餐', '查看机场用餐', 'muted'),
    new TripNode('wifi', 'WiFi', '连接机场 WiFi', 'muted'),
    new TripNode('reminder', '提醒', '设置行程提醒', 'muted'),
    new TripNode('customer-service', '客服', '联系行程客服', 'muted')
  ]
};
