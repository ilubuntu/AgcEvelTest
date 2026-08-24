import { AppStorageV2, UIUtils } from '@kit.ArkUI';
import { BaseViewModel, Logger } from 'lib_common';
import {
  HistoryModel,
  HistoryResponse,
  VideoResponse,
  VideoServiceApi
} from 'lib_video_api';
import { JSON, util } from '@kit.ArkTS';
import { MovieItem, PlayerVM } from 'recorded_player';

const TAG = 'PlayViewModel'

@ObservedV2
export class PlayViewModel extends BaseViewModel {
  @Trace videoInfo: VideoResponse = {} as VideoResponse;
  @Trace recommendVideoList: VideoResponse[] = []
  history: HistoryModel = AppStorageV2.connect(HistoryModel, () => new HistoryModel())!;
  @Trace playerVM: PlayerVM = PlayerVM.instance;
  videoItems: MovieItem[] = [];
  @Trace isLayoutFullScreen: boolean = false;
  @Trace totalTime: number = 0
  @Trace playTime: number = 0
  @Trace currentEpisode: number = 0

  init(videoId: string, index: number) {
    Logger.info(TAG, `videoId: ${videoId}, index: ${index}`);
    const videoInfo = VideoServiceApi.queryVideoDetail(videoId) as VideoResponse
    this.videoInfo = UIUtils.makeObserved(videoInfo)

    videoInfo.videoUrl.forEach((url, index) => {
      let progress: number = 0
      if (videoInfo.currentEpisode === index) {
        progress = videoInfo.currentProgress
      }
      this.videoItems.push(new MovieItem(
        videoInfo.videoId + index,
        `第${index + 1}集`,
        progress,
        url as string,
        videoInfo.coverUrl
      ));
    });
    this.currentEpisode = index ?? (videoInfo?.currentEpisode || 0)
    this.recommendVideoList = VideoServiceApi.queryRecommendVideo(videoInfo);
  }

  addHistory() {
    const idx = this.history.historyList.findIndex((item) => {
      return item.videoId === this.videoInfo.videoId && item.url === this.videoInfo.videoUrl[this.currentEpisode]
    })
    if (idx > -1) {
      this.history.historyList.splice(idx, 1)
    }
    const history: HistoryResponse = {
      historyId: Date.now().toString(36) + util.generateRandomUUID().replace(/-/g, '').substring(2, 15),
      videoId: this.videoInfo.videoId,
      videoInfo: this.videoInfo,
      url: this.videoInfo.videoUrl[this.currentEpisode],
      sectionNo: this.currentEpisode,
      totalTime: this.totalTime,
      playTime: this.playTime,
      time: new Date()
    }
    this.history.historyList.unshift(history)
  }

  saveSectionNoAndTime() {
    VideoServiceApi.saveCurrentInfo(this.videoInfo.videoId, this.currentEpisode,
      this.playTime / this.totalTime * 100)
  }
}
