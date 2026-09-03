import {
  ProductInfoPageParam,
  RouterMap,
  routerStack,
  SPLIT_ABILITY_NAME,
  WindowUtil,
} from 'lib_foundation';

@Entry({ useSharedStorage: true })
@Component
struct SplitIndex {
  @State
  stack: NavPathStack = new NavPathStack()
  @LocalStorageLink('splitProductId')
  productId: string = ''
  @LocalStorageLink('splitSlotId')
  slotId: string = ''

  aboutToAppear(): void {
    const uiContext = this.getUIContext()
    WindowUtil.setUIContext(uiContext, SPLIT_ABILITY_NAME)
    WindowUtil.activate(SPLIT_ABILITY_NAME)
    routerStack.registerStack(this.stack, SPLIT_ABILITY_NAME)
    if (this.productId.length > 0 && this.stack.size() === 0) {
      const param: ProductInfoPageParam = {
        productId: this.productId,
        slotId: this.slotId.length > 0 ? this.slotId : undefined,
        isSplitPage: true,
      }
      this.stack.pushPath({ name: RouterMap.PRODUCT_INFO, param }, false)
    }
  }

  build() {
    Navigation(this.stack) {
    }
    .backgroundColor($r('app.color.background_color_grey'))
    .hideBackButton(true)
    .hideNavBar(true)
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)
  }
}
