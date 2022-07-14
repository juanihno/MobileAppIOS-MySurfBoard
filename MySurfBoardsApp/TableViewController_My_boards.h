//
//  TableViewController_My_boards.h
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
#import "ViewController_Update_Boards.h"

@interface TableViewController_My_boards : UITableViewController{
    NSMutableDictionary *objNSDictinoaryListOfBoards;}
@property FIRFirestore *db;
@end
