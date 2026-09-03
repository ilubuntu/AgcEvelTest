import { AbilityConstant, common, StartOptions, Want } from '@kit.AbilityKit';
import { UtilLog } from '@hw-agconnect/util-log';
import { PopViewUtil } from './PopViewUtil';
import { NavigationHistoryItem, routerUtil } from './RouterUtil';
import { WindowUtil } from './WindowUtil';

const TAG: string = '[SplitScreenManager]';

export const MAIN_ABILITY_NAME: string = 'EntryAbility';
export const SPLIT_ABILITY_NAME: string = 'SplitScreenAbility';
export const SPLIT_PRODUCT_ID_KEY: string = 'splitProductId';
export const SPLIT_SLOT_ID_KEY: string = 'splitSlotId';
export const SPLIT_REVISION_KEY: string = 'splitRevision';

export type SplitStateListener = (active: boolean) => void;

class SplitScreenManager {
  private active: boolean = false;
  private launching: boolean = false;
  private merging: boolean = false;
  private splitContext?: common.UIAbilityContext;
  private listeners: SplitStateListener[] = [];

  public get isActive(): boolean {
    return this.active;
  }

  public addStateListener(listener: SplitStateListener): void {
    if (!this.listeners.includes(listener)) {
      this.listeners.push(listener);
    }
  }

  public removeStateListener(listener: SplitStateListener): void {
    this.listeners = this.listeners.filter((item: SplitStateListener) => item !== listener);
  }

  public onSplitAbilityCreate(context: common.UIAbilityContext): void {
    this.splitContext = context;
    this.setActive(true);
  }

  public onSplitAbilityDestroy(): void {
    this.splitContext = undefined;
    this.launching = false;
    this.merging = false;
    routerUtil.unregisterStack(SPLIT_ABILITY_NAME);
    PopViewUtil.clearAbility(SPLIT_ABILITY_NAME);
    WindowUtil.clearUIContext(SPLIT_ABILITY_NAME);
    routerUtil.activateStack(MAIN_ABILITY_NAME);
    WindowUtil.activate(MAIN_ABILITY_NAME);
    this.setActive(false);
  }

  public onMainAbilityDestroy(): void {
    routerUtil.unregisterStack(MAIN_ABILITY_NAME);
    PopViewUtil.clearAbility(MAIN_ABILITY_NAME);
    WindowUtil.clearUIContext(MAIN_ABILITY_NAME);
  }

  public async startSplit(productId: string, slotId?: string): Promise<void> {
    if (this.active || this.launching) {
      return;
    }
    this.launching = true;
    const context: common.UIAbilityContext = WindowUtil.globalUIAbilityContext;
    if (context === undefined) {
      WindowUtil.toast('当前窗口暂不支持分屏');
      return;
    }
    const want: Want = {
      bundleName: context.abilityInfo.bundleName,
      moduleName: context.abilityInfo.moduleName,
      abilityName: SPLIT_ABILITY_NAME,
      parameters: {
        splitProductId: productId,
        splitSlotId: slotId ?? '',
        isSplitPage: true,
      },
    };
    const options: StartOptions = {
      windowMode: AbilityConstant.WindowMode.WINDOW_MODE_SPLIT_SECONDARY,
    };
    try {
      await context.startAbility(want, options);
      this.setActive(true);
    } catch (err) {
      UtilLog.error(TAG, 'start split ability failed: ' + JSON.stringify(err));
      WindowUtil.toast('分屏启动失败，请稍后重试');
    } finally {
      this.launching = false;
    }
  }

  public async mergeFromMain(): Promise<void> {
    if (this.merging) {
      return;
    }
    if (!this.active || this.splitContext === undefined) {
      this.setActive(false);
      return;
    }
    this.merging = true;
    const history: NavigationHistoryItem[] = routerUtil.snapshot(SPLIT_ABILITY_NAME);
    if (history.length > 0) {
      routerUtil.restore(history, MAIN_ABILITY_NAME);
    }
    await this.terminateSplitAbility();
  }

  public async mergeFromSplit(): Promise<void> {
    if (this.merging) {
      return;
    }
    this.merging = true;
    await this.terminateSplitAbility();
  }

  private async terminateSplitAbility(): Promise<void> {
    const context: common.UIAbilityContext | undefined = this.splitContext;
    if (context === undefined) {
      this.onSplitAbilityDestroy();
      return;
    }
    try {
      await context.terminateSelf();
    } catch (err) {
      this.merging = false;
      UtilLog.error(TAG, 'terminate split ability failed: ' + JSON.stringify(err));
      WindowUtil.toast('合并失败，请稍后重试');
    }
  }

  private setActive(active: boolean): void {
    if (this.active === active) {
      return;
    }
    this.active = active;
    this.listeners.forEach((listener: SplitStateListener) => {
      listener(active);
    });
  }
}

export const splitScreenManager: SplitScreenManager = new SplitScreenManager();
