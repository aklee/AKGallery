
# AKGallery
<img src="./pics/Icon-180.png" width="60px;"/> 



####效果图片<br />
![image](./AKGalleryDemo.gif)<br /><br />
 
<br />
<img src="./pics/demo1.png" width="260px;"/>
<img src="./pics/demo2.png" width="260px;"/>
<img src="./pics/demo3.png" width="260px;"/>
<img src="./pics/demo4.png" width="260px;"/>

<br /><br />

####三方资源<br />
>1.Masonry<br />
>2.SDWebImage<br />


####使用方式<br />
支持iOS7及以上

```
            #import "AKGallery.h"
  
  
            AKGallery* gallery = AKGallery.new;
            
            //设置方式1 set items
            AKGalleryItem* item1 = [AKGalleryItem itemWithTitle:@"test1" url: @"http://pic.58pic.com/58pic/11/47/30/17v58PICrPa.jpg" img:nil];
            
            AKGalleryItem* item2 = [AKGalleryItem itemWithTitle:@"test2" url: @"http://www.88tou.com/wp-content/uploads/2013/01/88ttese2013012168.jpg" img:nil];
            
            gallery.items=@[item1,item2];
            
            
            //或者设置方式2 set items
            gallery.items=@[
                            @"http://img2.imgtn.bdimg.com/it/u=1900813244,4209729478&fm=21&gp=0.jpg",
                            @"http://img1.imgtn.bdimg.com/it/u=1064862525,2849788414&fm=21&gp=0.jpg",
                            @"http://www.88tou.com/wp-content/uploads/2013/01/88ttese2013012165.jpg",
                            @"http://pic.58pic.com/58pic/11/47/30/17v58PICrPa.jpg",
                            @"http://v1.qzone.cc/avatar/201411/20/17/22/546db2c587ff4915.jpg%21180x180.jpg",
                            @"http://www.88tou.com/wp-content/uploads/2013/01/88ttese2013012168.jpg",
                            @"http://imgsrc.baidu.com/forum/w%3D580/sign=e2203e28b74543a9f51bfac42e168a7b/7af40ad162d9f2d30615c433a9ec8a136227cce2.jpg",
                            ];
            

            
            
            
            AKGalleryCustUI* cust=AKGalleryCustUI.new;
            gallery.custUI=cust;
            gallery.completion=^{
                NSLog(@"completion gallery");
                
            };
            gallery.choose=^(NSInteger idx) {
                NSLog(@"you choose img:%ld",idx);
            };
            //show gallery
            [self presentAKGallery:gallery animated:YES completion:nil];
            
```



####如何修改UI:AKGalleryCustUI<br />
```

#pragma mark - Navigation
//navigation tint
//effects on AKGallery . default red
//修改导航色调， 可修改返回图标颜色
@property(nonatomic,strong)UIColor* navigationTint;

#pragma mark - List
//default @"概览"
//图片列表标题
@property(nonatomic,strong)NSString* listTitle;

#pragma mark - Viewer
//default  1
//图片间距
@property(nonatomic,assign)float spaceBetweenViewer;

//image viewer bar tintcolor
//底部工具栏，可修改工具栏图标颜色
@property(nonatomic,strong)UIColor* viewerBarTint;

//default no
//是否黑色背景
@property(nonatomic,assign)bool viewerBackgroundBlack;

//default 0.5
//最大缩小倍数
@property(nonatomic,assign)float minZoomScale;

//default 3
//最大放大倍数
@property(nonatomic,assign)float maxZoomScale;

//default NO
//if yes ,it will pop to list
//是否只是单张浏览
@property(nonatomic,assign)bool onlyViewer;

```












