import { Want } from '@kit.AbilityKit';
import UIAbility from '@ohos.app.ability.UIAbility';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import window from '@ohos.window';
import { UtilLog } from '@hw-agconnect/util-log';
import {
  ProductInfoPageParam,
  RouterMap,
  routerStack,
  SPLIT_ABILITY_NAME,
  SPLIT_PRODUCT_ID_KEY,
  SPLIT_REVISION_KEY,
  SPLIT_SLOT_ID_KEY,
  splitScreenManager,
  WindowUtil,
} from 'lib_foundation';

const TAG: string = '[SplitScreenAbility]';

class SplitStorageInit {
  splitProductId: string = '';
  splitSlotId: string = '';
  splitRevision: number = 0;
}

export default class SplitScreenAbility extends UIAbility {
  private storage: LocalStorage = new LocalStorage(new SplitStorageInit());
  private mainWindow?: window.Window;
  private released: boolean = false;
  private windowEventCallback = (event: window.WindowEventType): void => {
    if (event === window.WindowEventType.WINDOW_ACTIVE) {
      WindowUtil.activate(SPLIT_ABILITY_NAME);
      routerStack.activateStack(SPLIT_ABILITY_NAME);
    }
  };

  onCreate(want: Want): void {
    splitScreenManager.onSplitAbilityCreate(this.context);
    this.applyWant(want, false);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    try {
      windowStage.loadContent('views/SplitIndex', this.storage, (): void => {
        try {
          this.mainWindow = windowStage.getMainWindowSync();
          const uiContext = this.mainWindow.getUIContext();
          WindowUtil.setUIContext(uiContext, SPLIT_ABILITY_NAME);
          WindowUtil.activate(SPLIT_ABILITY_NAME);
          this.mainWindow.on('windowEvent', this.windowEventCallback);
          uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
        } catch (err) {
          UtilLog.error(TAG, 'initialize split window failed: ' + JSON.stringify(err));
        }
      });
    } catch (err) {
      UtilLog.error(TAG, 'load split content failed: ' + JSON.stringify(err));
      this.releaseWindowResources();
    }
  }

  onNewWant(want: Want): void {
    this.applyWant(want, true);
  }

  onWindowStageDestroy(): void {
    this.releaseWindowResources();
  }

  onDestroy(): void {
    this.releaseWindowResources();
  }

  private applyWant(want: Want, replaceRoute: boolean): void {
    const productId: string = want.parameters?.[SPLIT_PRODUCT_ID_KEY] as string ?? '';
    const slotId: string = want.parameters?.[SPLIT_SLOT_ID_KEY] as string ?? '';
    this.storage.setOrCreate(SPLIT_PRODUCT_ID_KEY, productId);
    this.storage.setOrCreate(SPLIT_SLOT_ID_KEY, slotId);
    const revision: number = (this.storage.get<number>(SPLIT_REVISION_KEY) ?? 0) + 1;
    this.storage.setOrCreate(SPLIT_REVISION_KEY, revision);
    if (replaceRoute && productId.length > 0) {
      const param: ProductInfoPageParam = {
        productId,
        slotId: slotId.length > 0 ? slotId : undefined,
        isSplitPage: true,
      };
      routerStack.restore([{ name: RouterMap.PRODUCT_INFO, param }], SPLIT_ABILITY_NAME);
    }
  }

  private releaseWindowResources(): void {
    if (this.released) {
      return;
    }
    this.released = true;
    try {
      this.mainWindow?.off('windowEvent', this.windowEventCallback);
    } catch (err) {
      UtilLog.error(TAG, 'remove window listener failed: ' + JSON.stringify(err));
    }
    this.mainWindow = undefined;
    splitScreenManager.onSplitAbilityDestroy();
  }
}
