import { BreakpointModel, BreakpointNameEnum, CommonConstants, RouterMap, RouterUtils } from 'lib_common';
import { ContentType, VideoServiceApi } from 'lib_video_api';
import { MoreRecommendView } from '../components/MoreRecommendView';
import { SelectTvView } from '../components/SelectTvView';
import { VideoInfoView } from '../components/VideoInfoView';
import { PlayViewModel } from '../viewmodels/PlayViewModel';
import { PlayerComponent } from 'recorded_player';
import { AppStorageV2, promptAction } from '@kit.ArkUI';

@Builder
export function PlayPageBuilder() {
  PlayPage()
}

@ComponentV2
struct PlayPage {
  @Local vm: PlayViewModel = new PlayViewModel();
  @Local breakpointModel: BreakpointModel = AppStorageV2.connect(BreakpointModel, () => new BreakpointModel())!;

  build() {
    NavDestination() {
      Column() {
        // 播放器
        Stack() {
          PlayerComponent({
            movieItems: this.vm.videoItems,
            playerIndex: this.vm.currentEpisode,
            fullScreen: (isLayoutFullScreen: boolean) => {
              this.vm.isLayoutFullScreen = isLayoutFullScreen
            },
            callbackTimeUpdate: (nol: number, total: number) => {
              this.vm.totalTime = total
              this.vm.playTime = nol
            },
            selectionEvent: (idx: number) => {
              this.vm.currentEpisode = idx
            },
            listenVideoEvent: (bool) => {
            },
            playerPauseAndPlay: (bool) => {
            }
          })
            .width('100%')
            .height(this.vm.isLayoutFullScreen ? '100%' :
              this.breakpointModel.currentBreakpoint === BreakpointNameEnum.SM ? 238 : 416)
            .clip(true)

          Image($r('app.media.icon_back_white'))
            .width(40)
            .height(40)
            .margin({ left: 16, top: 4 })
            .visibility(this.vm.isLayoutFullScreen ? Visibility.None : Visibility.Visible)
            .onClick(() => {
              RouterUtils.pop()
            })
        }.alignContent(Alignment.TopStart)

        // 视频内容
        Scroll() {
          Column({ space: 25 }) {
            // 视频信息
            VideoInfoView({ video: this.vm.videoInfo })
            // 视频交互按钮栏
            GridRow({ columns: 5, direction: GridRowDirection.Row }) {
              GridCol() {
                Stack() {
                  Image($r('app.media.icon_tv_comment')).width(24).height(24)
                  Text(this.vm.videoInfo.commentCount.toString())
                    .fontSize(10).lineHeight(12).fontWeight(FontWeight.Bold).fontColor(Color.White)
                    .position({ top: -8, left: 18 })
                    .visibility(this.vm.videoInfo.commentCount ? Visibility.Visible : Visibility.None)
                }.onClick(() => {})
              }
              GridCol() {
                Stack() {
                  if (this.vm.videoInfo.isLiked) {
                    Image($r('app.media.icon_tv_like_active')).width(24).height(24)
                  } else {
                    Image($r('app.media.icon_tv_like')).width(24).height(24).colorFilter(Color.White)
                  }
                  Text(this.vm.videoInfo.likeCount.toString())
                    .fontSize(10).lineHeight(12).fontWeight(FontWeight.Bold).fontColor(Color.White)
                    .position({ top: -8, left: 18 })
                    .visibility(this.vm.videoInfo.likeCount ? Visibility.Visible : Visibility.None)
                }.onClick(() => {
                  this.vm.videoInfo.isLiked = !this.vm.videoInfo.isLiked
                  if (this.vm.videoInfo.isLiked) {
                    promptAction.showToast({ message: '已点赞' })
                    this.vm.videoInfo.likeCount++
                  } else {
                    promptAction.showToast({ message: '取消点赞' })
                    this.vm.videoInfo.likeCount--
                  }
                  VideoServiceApi.changeLike(this.vm.videoInfo.videoId, this.vm.videoInfo.isLiked)
                })
              }
              GridCol() {
                Stack() {
                  Image(this.vm.videoInfo.isMarked ? $r('app.media.icon_tv_collect_active') : $r('app.media.icon_tv_collect'))
                    .width(24).height(24)
                }.onClick(() => {
                  this.vm.videoInfo.isMarked = !this.vm.videoInfo.isMarked
                  if (this.vm.videoInfo.isMarked) {
                    promptAction.showToast({ message: '已收藏' })
                    this.vm.videoInfo.markCount++
                  } else {
                    promptAction.showToast({ message: '取消收藏' })
                    this.vm.videoInfo.markCount--
                  }
                  VideoServiceApi.changeMark(this.vm.videoInfo.videoId, this.vm.videoInfo.isMarked)
                })
              }
              GridCol() {
                Stack() {
                  Image($r('app.media.icon_tv_download')).width(24).height(24)
                }.onClick(() => {})
              }
              GridCol() {
                Stack() {
                  Image($r('app.media.icon_tv_share')).width(24).height(24)
                }.onClick(() => {})
              }
            }

            // 选集
            if (this.vm.videoInfo.contentType === ContentType.TvMovie) {
              SelectTvView({
                video: this.vm.videoInfo,
                currentIndex: this.vm.currentEpisode,
                playVideo: (index: number) => {
                  this.vm.currentEpisode = index
                }
              })
            }

            // 更多推荐
            MoreRecommendView({ recommendVideoList: this.vm.recommendVideoList })

          }.alignItems(HorizontalAlign.Start)
          .padding({ top: 20 })
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .align(Alignment.Top)
        .edgeEffect(EdgeEffect.Spring)
      }
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
      .padding(this.vm.isLayoutFullScreen ? 0 :
        { bottom: this.vm.windowModel.windowBottomPadding, top: this.vm.windowModel.windowTopPadding })
    }
    .id(this.vm.playerVM.navId)
    .hideTitleBar(true)
    .backgroundColor('#16151A')
    .onReady((context: NavDestinationContext) => {
      if (context.pathInfo.param) {
        const params = context.pathInfo.param as Record<string, Object>;
        const videoId = params.videoId as string;
        const index = params.index as number
        // 默认（第一集）
        this.vm.init(videoId, index)
      }
    })
    .onWillDisappear(() => {
      this.vm.addHistory()
      this.vm.saveSectionNoAndTime()

    })
  }
}