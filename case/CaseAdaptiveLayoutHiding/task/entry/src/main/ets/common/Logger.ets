import { hilog } from '@kit.PerformanceAnalysisKit';

export const LOG_DOMAIN: number = 0x0000;
export const LOG_TAG: string = 'CaseDisplayPriority';
export const LOG_FALLBACK_MESSAGE: string = '[unserializable]';

export function formatLogCause(cause: Object | undefined): string {
  try {
    return JSON.stringify(cause);
  } catch (error) {
    return LOG_FALLBACK_MESSAGE;
  }
}

export function logInfo(message: string): void {
  hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', message);
}

export function logError(message: string, cause: Object | undefined): void {
  hilog.error(LOG_DOMAIN, LOG_TAG, `${message}. Cause: %{public}s`, formatLogCause(cause));
}
