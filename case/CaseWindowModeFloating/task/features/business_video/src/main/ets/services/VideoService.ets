import { NewsResponse, VideoServiceApi } from 'lib_news_api';
import { VideoNewsData } from '../models/VideoModel';

export class VideoService {
  private static createVideoList(list: NewsResponse[]): VideoNewsData[] {
    let tempList: VideoNewsData[] = list.map((item: NewsResponse) => {
      return new VideoNewsData(item);
    })
    return tempList
  }

  // 查询视频流，如果有userId，查询对应用户的视频。需要区分是纯视频还是发的动态中的视频
  public static async queryVideoList(authorId: string = '', type: number = 1): Promise<VideoNewsData[]> {
    let list = await VideoServiceApi.queryVideoList(authorId, type);
    let videoList: VideoNewsData[] = VideoService.createVideoList(list);
    // 保持 mock 数据原始顺序（不再随机打乱），便于用例按固定索引断言视频方向
    return videoList;
  }

}