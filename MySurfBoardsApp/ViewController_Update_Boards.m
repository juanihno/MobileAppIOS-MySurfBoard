//
//  ViewController_Update_Boards.m
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "ViewController_Update_Boards.h"

@interface ViewController_Update_Boards ()
@property (strong, nonatomic) IBOutlet UITextField *txtBrand;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtSize;
@property (strong, nonatomic) IBOutlet UITextView *txtDescription;
@property (strong, nonatomic) IBOutlet UISlider *txtScore;
@property NSString   *score;  // intended to be globally accessible
@property (strong, nonatomic) IBOutlet UILabel *erroLabel;


@end

@implementation ViewController_Update_Boards

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.txtBrand.text=_boardBrand;
    _txtName.text=_boardName;
    _txtBrand.text=_boardBrand;
    _txtDescription.text=_boardDescription;
    _txtSize.text= _boardSize;
   // _boardScore=_txtScore.text;
//    self.txtName.text=_boardName;
//    self.txtBrand.text=_boardBrand;
//    self.txtDescription.text=_boardDescription;
//    self.txtSize.text= _boardSize;



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)DeleteAndBacktoHome:(id)sender {
    [[[self.db collectionWithPath:@"boards"] documentWithPath:_boardId]
        deleteDocumentWithCompletion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error removing document: %@",[ error localizedDescription]);
          } else {
            NSLog(@"Document successfully removed!");
          }
    }];
    
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
    vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
    //[self presentViewController:vc animated:YES completion:NULL];
    [self.navigationController pushViewController:vc animated:TRUE];
}
- (IBAction)UpdateAndBacktoHome:(id)sender {
    NSString *brand=_txtBrand.text;
    NSString *name=_txtName.text;
    NSString *size=_txtSize.text;
    NSString *description=_txtDescription.text;
    
    if (brand==NULL || name==NULL || size==NULL || size==NULL || description== NULL|| _score==NULL ){
        _erroLabel.text=@"fill all the fields";
        NSLog(@"NSLog fill all the fields");

    }
    else{
        [[[self.db collectionWithPath:@"boards"] documentWithPath:_boardId] setData:@{
          @"brand": brand,
          @"name": name,
          @"size": size,
          @"score": _score,
          @"description":description


        } completion:^(NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error adding document: %@", error);
          } else {
              NSLog(@"Document added with ID: %@", self->_boardId);
              [[self.db collectionWithPath:@"boards"]
                  getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot,
                                               NSError * _Nullable error) {
                    if (error != nil) {
                      NSLog(@"Error getting documents: %@", error);
                    } else {
                      for (FIRDocumentSnapshot *document in snapshot.documents) {
                        NSLog(@"%@ => %@", document.documentID, document.data);
                      }
                    }
                  }];
              UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
              UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
              vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
              //[self presentViewController:vc animated:YES completion:NULL];
              [self.navigationController pushViewController:vc animated:TRUE];

          }
        }];}
    
//    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *vc=[sb instantiateViewControllerWithIdentifier:@"ViewController_Home_Menu"];
//    vc.modalTransitionStyle= UIModalTransitionStyleFlipHorizontal;
//    //[self presentViewController:vc animated:YES completion:NULL];
//    [self.navigationController pushViewController:vc animated:TRUE];

}
- (IBAction)changeSlider:(id)sender {
    UISlider *slider = (UISlider *)sender;
    _score = [NSString stringWithFormat:@"%f", slider.value];

}
@end
