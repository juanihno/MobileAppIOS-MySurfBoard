//
//  TableViewControllerReviews.h
//  MySurfBoardsApp
//
//  Created by juan on 20/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
#import "ViewController_Review.h"
@interface TableViewControllerReviews : UITableViewController{
NSMutableDictionary *objNSDictinoaryListOfBoards;}
@property FIRFirestore *db;
@end
