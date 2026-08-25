@Entry
@ComponentV2
struct Index {
  @Local currentIndex: number = 0
  @Local bannerCurrentIndex: number = 0
  private signInDays: number = 7
  private flashSaleTime: string = '12:00:00'

  build() {
    Scroll() {
      Column() {
        this.searchBar()
        this.bannerSection()
        this.categoryNav()
        this.signInFlashSale()
        this.productList()
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding({ left: 16, right: 16 })
    .id('home-page')
  }

  @Builder
  searchBar() {
    Column() {
      Text('首页')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 8 })

      Row() {
        Flex() {
          Row() {
            SymbolGlyph($r('sys.symbol.magnifyingglass'))
              .fontSize(18)
              .fontColor([$r('app.color.font_color_level1')])
              .margin({ right: 16 })
            Text('衬衫')
              .fontSize(14)
              .fontColor('#999999')
          }
          .height('100%')
          .alignItems(VerticalAlign.Center)
        }
        .width(200)
        .height(36)
        .backgroundColor('#EEEEEE')
        .borderRadius(18)
        .padding({ left: 12, right: 12 })
        .id('search-input')
      }
      .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .padding({ top: 10, bottom: 10 })
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  bannerSection() {
    Column(){
      Swiper() {
        ForEach([1, 2, 3], (item: number) => {
          Stack() {
            if (item === 1) {
              Column() {
                Image($r('app.media.banner1'))
                  .width('100%')
                  .height(180)
                  .objectFit(ImageFit.Cover)
              }
              .width('100%')
              .height(180)
              .backgroundColor('#FFE4E1')
            } else {
              Column() {
                Image($r('app.media.banner2'))
                  .width('100%')
                  .height(180)
                  .objectFit(ImageFit.Cover)
              }
              .width('100%')
              .height(180)
              .backgroundColor('#FFF8DC')
            }
          }
        })
      }
      .index(this.bannerCurrentIndex)
      .autoPlay(true)
      .interval(3000)
      .indicator(true)
      .width('100%')
      .height(180)
      .margin({bottom:10})
      .borderRadius(12)
    }
    .id('banner-area')

  }

  @Builder
  categoryNav() {
    Row() {
      ForEach([
        { icon: $r('app.media.icon1'), name: '精选' },
        { icon: $r('app.media.icon2'), name: '清洁用品' },
        { icon: $r('app.media.icon3'), name: '全棉用品' },
        { icon: $r('app.media.icon4'), name: '安睡香氛' },
        { icon: $r('app.media.icon6'), name: '运动休闲' }
      ], (item: Record<string, Resource>) => {
        Column() {
          Image(item.icon)
            .width(44)
            .height(44)
          Text(item.name)
            .fontSize(11)
            .margin({ top: 4 })
        }
        .layoutWeight(1)
      })
    }
    .width('100%')
    .height(80)
    .padding({ top: 12 })
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .id('category-nav')
  }

  @Builder
  signInFlashSale() {
    Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center, direction: FlexDirection.Column }) {
        Image($r('app.media.ic_checkin'))
          .width(32)
          .height(32)
        Text('签到')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 6 })
        Text('已签到' + this.signInDays + '天')
          .fontSize(10)
          .fontColor('#999999')
          .margin({ top: 2 })
      }
      .width(100)
      .height(100)
      .backgroundColor('#FFFFFF')
      .borderRadius(12)
      .margin({ right: 6 })
      .id('card-checkin')

      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center, direction: FlexDirection.Column }) {
        Row() {
          Image($r('app.media.ic_seckill'))
            .width(24)
            .height(24)
          Text('秒杀')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 6 })
        }

        Text('距离开始 ' + this.flashSaleTime)
          .fontSize(12)
          .fontColor('#FF6B6B')
          .margin({ top: 8 })
      }
      .width(100)
      .height(100)
      .backgroundColor('#FFFFFF')
      .borderRadius(12)
      .margin({ left: 6 })
      .id('card-seckill')
    }
    .width('100%')
    .height(112)
    .padding({
      top: 10,
      bottom: 10
    })
    .id('card-area')
  }

  @Builder
  productList() {
    Column() {
      Text('推荐商品')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 16, bottom: 10 })

      Grid() {
        ForEach([1, 2, 3, 4, 5, 6], (item: number) => {
          GridItem() {
            Column() {
              Column() {
                Image($r('app.media.product_banner'))
                  .width('100%')
                  .height('100%')
                  .objectFit(ImageFit.Contain)
              }
              .width('100%')
              .aspectRatio(1)
              .backgroundColor('#FAFAFA')

              Text('时尚轻商务系列针织打底纯羊毛内搭')
                .fontSize(12)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .margin({ top: 8 })

              Row() {
                Text('上新折扣')
                  .fontSize(10)
                  .fontColor('#FFFFFF')
                  .backgroundColor('#007DFF')
                  .borderRadius(2)
                  .padding({
                    left: 4,
                    right: 4,
                    top: 2,
                    bottom: 2
                  })
                Text('VIP专享')
                  .fontSize(10)
                  .fontColor('#FFFFFF')
                  .backgroundColor('#FF5000')
                  .borderRadius(2)
                  .padding({
                    left: 4,
                    right: 4,
                    top: 2,
                    bottom: 2
                  })
                  .margin({ left: 4 })
              }
              .margin({ top: 6 })

              Row() {
                Text('¥188')
                  .fontSize(14)
                  .fontColor('#FF5000')
                  .fontWeight(FontWeight.Bold)
                Text('¥200')
                  .fontSize(10)
                  .fontColor('#999999')
                  .decoration({ type: TextDecorationType.LineThrough })
                  .margin({ left: 6 })
              }
              .margin({ top: 6 })
            }
            .width('100%')
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .padding(8)
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(8)
      .rowsGap(8)
      .width('100%')
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .padding({ top: 10 })
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .id('product-list')
  }
}
