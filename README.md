# AKGallery
[小木轮]图片浏览器



####效果图片<br />
![image](./AKGalleryDemo.gif)<br /><br />

<br />
####特性：<br />
>1.易用<br />
>2.减耦<br />
>3.可扩展<br />

<br /><br />

####使用其他三方资源<br />
>1.Masonry<br />
>2.SDWebImage<br />


####使用方式<br />
```
  #import "AKGallery.h"
  
  
 AKGallery* gallery = AKGallery.new;
            
            AKGalleryItem* item1 = [AKGalleryItem itemWithTitle:@"test1" url: @"http://pic.58pic.com/58pic/11/47/30/17v58PICrPa.jpg" img:nil];
            
            AKGalleryItem* item2 = [AKGalleryItem itemWithTitle:@"test2" url: @"http://www.88tou.com/wp-content/uploads/2013/01/88ttese2013012168.jpg" img:nil];
            
            gallery.items=@[item1,item2];
            
            
            
            AKGalleryCustUI* cust=AKGalleryCustUI.new;
            gallery.custUI=cust;
            gallery.completion=^{
                NSLog(@"completion gallery");
                
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












