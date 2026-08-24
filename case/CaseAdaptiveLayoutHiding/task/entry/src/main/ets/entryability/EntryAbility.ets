import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { logError, logInfo } from '../common/Logger';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      logError('Failed to set colorMode', err);
    }
    logInfo('Ability onCreate');
  }

  onDestroy(): void {
    logInfo('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    logInfo('Ability onWindowStageCreate');

    try {
      windowStage.loadContent('pages/Index', (err) => {
        if (err.code) {
          logError('Failed to load the content', err);
          return;
        }
        logInfo('Succeeded in loading the content.');
        try {
          this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        } catch (colorModeError) {
          logError('Failed to set light colorMode', colorModeError);
        }
      });
    } catch (e) {
      logError('Failed to load the content', e);
    }
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logInfo('Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    logInfo('Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    logInfo('Ability onBackground');
  }
}
