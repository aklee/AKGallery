//
//  ViewController.m
//  AKGallery
//
//  Created by ak on 16/11/8.
//  Copyright © 2016年 ak. All rights reserved.
//

#import "ViewController.h"
#import "AKGallery.h"
@interface ViewController ()
- (IBAction)clicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clicked:(UIButton*)btn{
    NSInteger tag= btn.tag;
    
    
    //prepare pics
    NSMutableArray* arr= @[].mutableCopy;
    
    for (int  i = 1; i<100; i++) {
        int idx=i%9+1;
        AKGalleryItem* item = [AKGalleryItem itemWithTitle:[NSString stringWithFormat:@"titile%d",i] url:nil img:[UIImage imageNamed:[NSString stringWithFormat:@"head%d.jpg",idx]]];
        
        [arr addObject:item];
    }
    
    
    switch (tag) {
        case 1:
        {
            AKGallery* gallery = AKGallery.new;
            gallery.items=arr;
            gallery.custUI=AKGalleryCustUI.new;
            gallery.completion=^{
                NSLog(@"completion gallery");
                
            };
            gallery.choose=^(NSInteger idx) {
                NSLog(@"you choose img:%ld",idx);
            };
            //show gallery
            [self presentAKGallery:gallery animated:YES completion:nil];
        }
            break;
        case  2:{
            AKGallery* gallery = AKGallery.new;
            gallery.items=arr;
            AKGalleryCustUI* cust=AKGalleryCustUI.new;
            //是否黑屏浏览图片
            //cust.viewerBackgroundBlack=YES;
            gallery.custUI=cust;
            gallery.selectIndex=55;
            gallery.completion=^{
                NSLog(@"completion gallery");
                
            };
            
            [self presentAKGallery:gallery animated:YES completion:nil];
        }
            
            
            break;
        case  3:{
            AKGallery* gallery = AKGallery.new;
            gallery.items=arr;
            AKGalleryCustUI* cust=AKGalleryCustUI.new;
            cust.viewerBackgroundBlack=YES;
            cust.onlyViewer=YES;
            gallery.custUI=cust;
            //默认开始浏览第55张图片
            gallery.selectIndex=55;
            gallery.completion=^{
                NSLog(@"completion gallery");
                
            };
            
            [self presentAKGallery:gallery animated:YES completion:nil];
        }
            
            
            break;
        case  4:{
            AKGallery* gallery = AKGallery.new;
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
            cust.viewerBackgroundBlack=YES;
            //仅显示图片浏览器，不显示列表
            cust.onlyViewer=YES;
            gallery.custUI=cust;
            
            gallery.completion=^{
                NSLog(@"completion gallery");
                
            };
            
            [self presentAKGallery:gallery animated:YES completion:nil];
        }
        case  5:{
            
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
        }
            
            
            break;
        default:
            break;
    }
}
@end
