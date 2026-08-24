export interface CaseItem {
  id: string;
  label: string;
  symbol: Resource;
}

export const DIAMOND_ENTRIES: CaseItem[] = [
  { id: 'entry-order', label: '订单', symbol: $r('sys.symbol.list_bullet') },
  { id: 'entry-favorite', label: '收藏', symbol: $r('sys.symbol.heart') },
  { id: 'entry-coupon', label: '卡券', symbol: $r('sys.symbol.coupon') },
  { id: 'entry-history', label: '浏览历史', symbol: $r('sys.symbol.clock') }
];

export const SIDEBAR_MENUS: CaseItem[] = [
  { id: 'menu-home', label: '首页', symbol: $r('sys.symbol.house') },
  { id: 'menu-message', label: '消息', symbol: $r('sys.symbol.bell') },
  { id: 'menu-schedule', label: '日程', symbol: $r('sys.symbol.calendar') },
  { id: 'menu-setting', label: '设置', symbol: $r('sys.symbol.gearshape') }
];

export const REMOTE_KEYS: CaseItem[] = [
  { id: 'remote-power', label: '电源', symbol: $r('sys.symbol.power') },
  { id: 'remote-menu', label: '菜单', symbol: $r('sys.symbol.line_3_horizontal') },
  { id: 'remote-back', label: '返回', symbol: $r('sys.symbol.arrow_left') },
  { id: 'remote-volume', label: '音量', symbol: $r('sys.symbol.speaker_wave_2') },
  { id: 'remote-channel', label: '频道', symbol: $r('sys.symbol.display') }
];
