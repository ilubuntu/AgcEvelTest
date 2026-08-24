export class FlightExtra {
  id: string = '';
  label: string = '';

  constructor(id: string, label: string) {
    this.id = id;
    this.label = label;
  }
}

export interface FlightSceneConfig {
  title: string;
  subtitle: string;
  pageId: string;
  infoRowId: string;
  sliderId: string;
  widthLabel: string;
  airline: string;
  flightNumber: string;
  aircraft: string;
  originCode: string;
  originTerminal: string;
  destCode: string;
  destTerminal: string;
  departureTime: string;
  duration: string;
  arrivalTime: string;
  gateLabel: string;
  gateValue: string;
  onTimeLabel: string;
  seatLabel: string;
  extras: FlightExtra[];
  shareLabel: string;
}

export const FLIGHT_SCENE: FlightSceneConfig = {
  title: 'CA1831 · 登机中',
  subtitle: '上海虹桥 T2 → 北京首都 T3 · 14:20 起飞',
  pageId: 'flight-page',
  infoRowId: 'flight-info-row',
  sliderId: 'flight-slider',
  widthLabel: '航班信息行宽度',
  airline: '中国国际航空',
  flightNumber: 'CA1831',
  aircraft: '波音 738',
  originCode: 'SHA',
  originTerminal: '虹桥 T2',
  destCode: 'PEK',
  destTerminal: '首都 T3',
  departureTime: '14:20',
  duration: '2h 25m',
  arrivalTime: '16:45',
  gateLabel: '登机口',
  gateValue: 'B12',
  onTimeLabel: '准点 92%',
  seatLabel: '座位 32A',
  extras: [
    new FlightExtra('aircraft', '机型 738'),
    new FlightExtra('meal', '有餐食'),
    new FlightExtra('wifi', 'WiFi'),
    new FlightExtra('lounge', '休息室'),
    new FlightExtra('coupon', '优惠券'),
    new FlightExtra('transfer', '中转提醒'),
    new FlightExtra('weather', '天气'),
    new FlightExtra('service', '服务台'),
    new FlightExtra('boarding-pass', '电子登机牌'),
    new FlightExtra('baggage', '行李额'),
    new FlightExtra('counter', '值机柜台'),
    new FlightExtra('security', '安检口'),
    new FlightExtra('lane', '快速通道'),
    new FlightExtra('vip-room', '贵宾厅'),
    new FlightExtra('meal-change', '餐食变更'),
    new FlightExtra('insurance', '延误险'),
    new FlightExtra('transfer-bus', '接驳车'),
    new FlightExtra('airport-map', '机场地图'),
    new FlightExtra('traffic', '交通'),
    new FlightExtra('weather-alert', '天气预警'),
    new FlightExtra('service-desk', '服务柜台'),
    new FlightExtra('refund', '退改签')
  ],
  shareLabel: '分享行程'
};
