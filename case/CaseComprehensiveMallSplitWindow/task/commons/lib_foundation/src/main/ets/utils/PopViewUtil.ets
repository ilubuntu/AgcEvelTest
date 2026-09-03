import { ComponentContent, promptAction, window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { UtilLog as Logger } from '@hw-agconnect/util-log';
import { WindowUtil } from './WindowUtil';

const TAG: string = '[PopViewUtil]';

export class PopViewUtil {
  private static _dialogNodes: Map<string, ComponentContent<Object>[]> = new Map();
  private static _sheetNodes: Map<string, ComponentContent<Object>[]> = new Map();

  private static _getUIContext(abilityName: string): UIContext | undefined {
    try {
      return WindowUtil.getUIContext(abilityName);
    } catch (err) {
      Logger.error(TAG, 'get ui context failed.' + JSON.stringify(err));
      return undefined;
    }
  }

  private static _getDialogNodes(abilityName: string): ComponentContent<Object>[] {
    let nodes: ComponentContent<Object>[] | undefined = PopViewUtil._dialogNodes.get(abilityName);
    if (nodes === undefined) {
      nodes = [];
      PopViewUtil._dialogNodes.set(abilityName, nodes);
    }
    return nodes;
  }

  private static _getSheetNodes(abilityName: string): ComponentContent<Object>[] {
    let nodes: ComponentContent<Object>[] | undefined = PopViewUtil._sheetNodes.get(abilityName);
    if (nodes === undefined) {
      nodes = [];
      PopViewUtil._sheetNodes.set(abilityName, nodes);
    }
    return nodes;
  }

  public static async openDialog<T extends Object>(
    builder: WrappedBuilder<[T]> | WrappedBuilder<[]>,
    options: promptAction.BaseDialogOptions,
    args?: T,
  ) {
    const abilityName: string = WindowUtil.activeAbilityName;
    const uiContext: UIContext | undefined = PopViewUtil._getUIContext(abilityName);
    if (uiContext === undefined) {
      return;
    }
    const dialogNodes: ComponentContent<Object>[] = PopViewUtil._getDialogNodes(abilityName);
    if (args) {
      dialogNodes.push(
        new ComponentContent(uiContext, builder, args),
      );
    } else {
      dialogNodes.push(
        new ComponentContent(uiContext, builder as WrappedBuilder<[]>),
      );
    }

    if (dialogNodes.length) {
      const latest = dialogNodes[dialogNodes.length - 1];
      try {
        if (!options.onWillDismiss) {
          options.onWillDismiss = () => {
            PopViewUtil.closeDialog(abilityName);
          };
        }
        await uiContext
          .getPromptAction()
          .openCustomDialog(latest, options);
        Logger.info(TAG, 'open custom dialog complete.');
      } catch (err) {
        Logger.error(
          TAG,
          `open custom dialog failed. error: ${JSON.stringify(err)}`,
        );
      }
    }
  }

  public static closeDialog(abilityName: string = WindowUtil.activeAbilityName): void {
    const uiContext: UIContext | undefined = PopViewUtil._getUIContext(abilityName);
    const dialogNodes: ComponentContent<Object>[] = PopViewUtil._getDialogNodes(abilityName);
    if (uiContext !== undefined && dialogNodes.length) {
      const latest = dialogNodes[dialogNodes.length - 1];
      uiContext
        .getPromptAction()
        .closeCustomDialog(latest)
        .then(() => {
          Logger.info(TAG, 'close custom dialog complete.');
          dialogNodes.pop();
        })
        .catch((error: BusinessError) => {
          Logger.error(
            TAG,
            `close custom dialog failed. error: ${JSON.stringify(error)}`,
          );
        });
    }
  }

  public static async openSheet<T extends Object>(
    builder: WrappedBuilder<[T]> | WrappedBuilder<[]>,
    options: SheetOptions,
    args?: T,
  ) {
    const abilityName: string = WindowUtil.activeAbilityName;
    const uiContext: UIContext | undefined = PopViewUtil._getUIContext(abilityName);
    if (uiContext === undefined) {
      return;
    }
    const sheetNodes: ComponentContent<Object>[] = PopViewUtil._getSheetNodes(abilityName);
    if (args) {
      sheetNodes.push(
        new ComponentContent(uiContext, builder, args),
      );
    } else {
      sheetNodes.push(
        new ComponentContent(uiContext, builder as WrappedBuilder<[]>),
      );
    }
    if (sheetNodes.length) {
      const latest = sheetNodes[sheetNodes.length - 1];
      try {
        if (!options.onWillDismiss) {
          options.onWillDismiss = () => {
            PopViewUtil.closeSheet(abilityName);
          };
        }
        await uiContext.openBindSheet(latest, options);
        Logger.info(TAG, 'open sheet complete.');
      } catch (err) {
        Logger.error(TAG, `open sheet failed. error: ${JSON.stringify(err)}`);
      }
    }
  }

  public static async closeSheet(abilityName: string = WindowUtil.activeAbilityName) {
    const uiContext: UIContext | undefined = PopViewUtil._getUIContext(abilityName);
    const sheetNodes: ComponentContent<Object>[] = PopViewUtil._getSheetNodes(abilityName);
    if (uiContext !== undefined && sheetNodes.length) {
      const latest = sheetNodes[sheetNodes.length - 1];
      try {
        await uiContext.closeBindSheet(latest);
        Logger.info(TAG, 'close sheet complete.');
        sheetNodes.pop();
      } catch (err) {
        Logger.error(TAG, `close sheet failed. error: ${JSON.stringify(err)}`);
      }
    } else {
      Logger.error(TAG, 'sheet node is empty');
    }
  }

  public static async closeAllSheet(abilityName: string = WindowUtil.activeAbilityName) {
    const uiContext: UIContext | undefined = PopViewUtil._getUIContext(abilityName);
    const sheetNodes: ComponentContent<Object>[] = PopViewUtil._getSheetNodes(abilityName);
    if (uiContext !== undefined && sheetNodes.length) {
      sheetNodes.forEach(async (item) => {
        try {
          await uiContext.closeBindSheet(item);
          Logger.info(TAG, 'close sheet complete.');
        } catch (err) {
          Logger.error(
            TAG,
            `close sheet failed. error: ${JSON.stringify(err)}`,
          );
        }
      });
      PopViewUtil._sheetNodes.set(abilityName, []);
    }
  }

  public static clearAbility(abilityName: string): void {
    PopViewUtil._dialogNodes.delete(abilityName);
    PopViewUtil._sheetNodes.delete(abilityName);
  }
}
