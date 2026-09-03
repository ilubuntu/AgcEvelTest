import { common } from '@kit.AbilityKit';
import { UIContext, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { UtilLog as Logger } from '@hw-agconnect/util-log';

const TAG: string = '[WindowUtil]';
const DEFAULT_ABILITY_NAME: string = 'EntryAbility';

class WindowUtil {
  private _uiContexts: Map<string, UIContext> = new Map();
  private _contexts: Map<string, Context> = new Map();
  private _activeAbilityName: string = DEFAULT_ABILITY_NAME;

  /**
   * 设置context
   * @param uiContext
   */
  public setUIContext(uiContext: UIContext, abilityName: string = this._activeAbilityName): void {
    this._uiContexts.set(abilityName, uiContext);
    const context: Context | undefined = uiContext.getHostContext();
    if (context !== undefined) {
      this._contexts.set(abilityName, context);
    }
    this._activeAbilityName = abilityName;
  }

  public activate(abilityName: string): void {
    this._activeAbilityName = abilityName;
  }

  public clearUIContext(abilityName: string): void {
    this._uiContexts.delete(abilityName);
    this._contexts.delete(abilityName);
    if (this._activeAbilityName === abilityName && this._uiContexts.has(DEFAULT_ABILITY_NAME)) {
      this._activeAbilityName = DEFAULT_ABILITY_NAME;
    }
  }

  public getUIContext(abilityName?: string): UIContext | undefined {
    return this._uiContexts.get(abilityName ?? this._activeAbilityName);
  }

  public getContext(abilityName?: string): Context | undefined {
    return this._contexts.get(abilityName ?? this._activeAbilityName);
  }

  public get activeAbilityName(): string {
    return this._activeAbilityName;
  }

  /**
   * 获取全局UIContext
   * @returns
   */
  public get globalUIContext() {
    return this.getUIContext() as UIContext;
  }

  /**
   * 获取全局Context
   * @returns
   */
  public get globalContext() {
    return this.getContext() as Context;
  }

  /**
   * 获取全局UIAbilityContext
   * @returns
   */
  public get globalUIAbilityContext() {
    return this.getContext() as common.UIAbilityContext;
  }

  /**
   * 打开toast
   * @param options
   */
  public toast(message: string): void {
    const uiContext: UIContext | undefined = this.getUIContext();
    if (uiContext === undefined) {
      Logger.error(TAG, 'show toast failed: active UIContext is not registered');
      return;
    }
    try {
      uiContext.getPromptAction().showToast({ message });
    } catch (err) {
      Logger.error(TAG, 'show toast failed. error: ' + JSON.stringify(err));
    }
  }

  public async setWindowScreen(isFull: boolean): Promise<void> {
    const context: Context | undefined = this.getContext();
    if (context === undefined) {
      Logger.error(TAG, 'set window layout failed: active Context is not registered');
      return;
    }
    window.getLastWindow(context).then((win) => {
      win.setWindowLayoutFullScreen(isFull).catch((err: BusinessError) => {
        Logger.error(TAG, 'set window layout failed. error: ' + JSON.stringify(err));
      });
    }).catch((err: BusinessError) => {
      Logger.error(TAG, 'get last window failed. error: ' + JSON.stringify(err));
    });
  }
}

const instance = new WindowUtil();

export { instance as WindowUtil };
