import { Want } from '@kit.AbilityKit';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import { KeyboardAvoidMode } from '@ohos.arkui.UIContext';
import window from '@ohos.window';
import {
  ColorModeUtil,
  MAIN_ABILITY_NAME,
  routerStack,
  splitScreenManager,
  WindowUtil,
} from 'lib_foundation';
import { LoneTakeAnimationsTransition } from 'module_transition';
import { UtilLog } from '@hw-agconnect/util-log';
import { SetupUtil } from '../utils/SetupUtil';

const TAG: string = '[EntryAbility]';

export default class EntryAbility extends UIAbility {
  private mainWindow?: window.Window;
  private released: boolean = false;
  private windowEventCallback = (event: window.WindowEventType): void => {
    if (event === window.WindowEventType.WINDOW_ACTIVE) {
      WindowUtil.activate(MAIN_ABILITY_NAME);
      routerStack.activateStack(MAIN_ABILITY_NAME);
    }
  };

  onCreate(want: Want): void {
    UtilLog.setGlobalConfig({
      tag: 'ComprehensiveMall',
      domain: 0xff00,
      open: true,
      showStack: false,
    });
    UtilLog.info(TAG, 'set global log config success.');
    ColorModeUtil.applySavedColorMode(this.context);
    SetupUtil.handleWant(want);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    try {
      windowStage.loadContent('views/Index', (): void => {
        try {
          this.mainWindow = windowStage.getMainWindowSync();
          const uiContext = this.mainWindow.getUIContext();
          WindowUtil.setUIContext(uiContext, MAIN_ABILITY_NAME);
          WindowUtil.activate(MAIN_ABILITY_NAME);
          this.mainWindow.on('windowEvent', this.windowEventCallback);
          uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
          LoneTakeAnimationsTransition.init(windowStage);
        } catch (err) {
          UtilLog.error(TAG, JSON.stringify(err));
        }
      });
    } catch (err) {
      UtilLog.error(TAG, 'loadContent failed: ' + JSON.stringify(err));
    }
  }

  onNewWant(want: Want): void {
    WindowUtil.activate(MAIN_ABILITY_NAME);
    routerStack.activateStack(MAIN_ABILITY_NAME);
    SetupUtil.handleWant(want);
    SetupUtil.jumpToTarget();
  }

  onWindowStageDestroy(): void {
    this.releaseWindowResources();
  }

  onDestroy(): void {
    this.releaseWindowResources();
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
    splitScreenManager.onMainAbilityDestroy();
  }
}
