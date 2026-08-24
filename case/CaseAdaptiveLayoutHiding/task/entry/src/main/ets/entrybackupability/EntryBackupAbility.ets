import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';
import { formatLogCause, logError, logInfo } from '../common/Logger';

export default class EntryBackupAbility extends BackupExtensionAbility {
  async onBackup(): Promise<void> {
    logInfo('onBackup ok');
    await Promise.resolve().catch((error: Error) => {
      logError('onBackup failed', error);
    });
  }

  async onRestore(bundleVersion: BundleVersion): Promise<void> {
    logInfo(`onRestore ok ${formatLogCause(bundleVersion)}`);
    await Promise.resolve().catch((error: Error) => {
      logError('onRestore failed', error);
    });
  }
}
