//
//  AKGalleryList.m
//  AKGallery
//
//  Created by ak on 16/11/8.
//  Copyright © 2016年 ak. All rights reserved.
//

#import "AKGalleryList.h"
#import "AKGallery.h"
#import "AKGalleryListCell.h"
#import "AKGalleryViewer.h"
NSString* identifier  = @"AKGalleryListCell";

@interface AKGalleryList ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation AKGalleryList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=self.gallery.custUI.listTitle;
    
    //back item
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=backItem;
    
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //todo:
    float width=[UIScreen mainScreen].bounds.size.width/3;
    layout.itemSize=CGSizeMake(width, width);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    
    UICollectionView* cv= [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:cv];
    cv.dataSource=self;
    cv.delegate=self;
    cv.showsHorizontalScrollIndicator=NO;
    cv.backgroundColor=[UIColor whiteColor];
    self.collectionView = cv;
    [cv registerClass:[AKGalleryListCell class] forCellWithReuseIdentifier:identifier];

    
    
    
}
-(void)back{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        if (self.gallery.completion) {
            self.gallery.completion();
        }
    }];
}



-(AKGallery*)gallery{
   
    return (AKGallery*) self.navigationController;
    
    
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.gallery.items.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AKGalleryListCell* cell= [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    AKGalleryItem* item = [self.gallery itemForRow:indexPath.row];
    
    cell.model=item;
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //push viewer
//    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    self.gallery.selectIndex=indexPath.row;
    
    AKGalleryItem* item = [self.gallery itemForRow:indexPath.row];
//
    AKLog(@"didselect %@ row:%ld",item.title,(long)indexPath.row);
    
    AKGalleryViewerContainer* viewer =AKGalleryViewerContainer.new;
    
    [self.navigationController pushViewController:viewer animated:YES];
    
    
}

@end
