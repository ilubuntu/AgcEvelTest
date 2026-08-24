// 工具栏1数据：优惠券 / 我的收藏 / 我的消息 / 地址管理
export class MainMenuItem {
  icon: Resource = $r('app.media.startIcon');
  label: string = '';

  constructor(icon: Resource, label: string) {
    this.icon = icon;
    this.label = label;
  }
}

export const MAIN_MENU_LIST: MainMenuItem[] = [
  new MainMenuItem($r('app.media.ic_mine_coupon'), '优惠券'),
  new MainMenuItem($r('app.media.ic_mine_collection'), '我的收藏'),
  new MainMenuItem($r('app.media.ic_mine_message'), '我的消息'),
  new MainMenuItem($r('app.media.ic_mine_address'), '地址管理'),
];

export const MAIN_MENU_IDS_EQUAL: string[] = [
  'main-menu-equal-item-0',
  'main-menu-equal-item-1',
  'main-menu-equal-item-2',
  'main-menu-equal-item-3',
];

export class OrderTabItem {
  icon: Resource = $r('app.media.startIcon');
  label: string = '';

  constructor(icon: Resource, label: string) {
    this.icon = icon;
    this.label = label;
  }
}

export const ORDER_TAB_LIST: OrderTabItem[] = [
  new OrderTabItem($r('app.media.ic_order_pending_payment'), '待付款'),
  new OrderTabItem($r('app.media.ic_order_pending_shipment'), '待发货'),
  new OrderTabItem($r('app.media.ic_order_pending_receipt'), '待收货'),
  new OrderTabItem($r('app.media.ic_order_pending_review'), '待评价'),
  new OrderTabItem($r('app.media.ic_order_refund_after_sale'), '退款/售后'),
];

export const ORDER_TAB_IDS_EQUAL: string[] = [
  'order-equal-item-0',
  'order-equal-item-1',
  'order-equal-item-2',
  'order-equal-item-3',
  'order-equal-item-4',
];