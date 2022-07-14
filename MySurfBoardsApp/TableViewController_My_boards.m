//
//  TableViewController_My_boards.m
//  MySurfBoardsApp
//
//  Created by juan on 19/11/21.
//  Copyright © 2021 juan. All rights reserved.
//

#import "TableViewController_My_boards.h"
#import "ViewController_Update_Boards.h"


@interface TableViewController_My_boards ()

@end

@implementation TableViewController_My_boards

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _db = [FIRFirestore firestore];
    
    objNSDictinoaryListOfBoards =[[NSMutableDictionary alloc]initWithCapacity:5];
    [[self.db collectionWithPath:@"boards"]
        getDocumentsWithCompletion:^(FIRQuerySnapshot * _Nullable snapshot,
                                     NSError * _Nullable error) {
          if (error != nil) {
            NSLog(@"Error getting documents: %@", error);
          } else {
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                NSString *key = document.documentID;
                NSDictionary *boardDetails = document.data;
                [self->objNSDictinoaryListOfBoards setObject:boardDetails forKey:key];
                
                //NSLog(@"%@ => %@", document.documentID, document.data);

            }
              NSLog(@"self->objNSDictionaryListOfBoards= %@", self->objNSDictinoaryListOfBoards);
              
              NSLog(@"self->objNSDictionaryListOfBoards= %@", self->objNSDictinoaryListOfBoards );
              
              [self.tableView reloadData];

          }
        }];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [objNSDictinoaryListOfBoards count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleIdentifier1" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *boardNo =[objNSDictinoaryListOfBoards allKeys][indexPath.row];
    NSString *boardName =objNSDictinoaryListOfBoards [boardNo][@"name"];
    NSString *boardBrand =objNSDictinoaryListOfBoards [boardNo][@"brand"];
    NSString *boardDescription =objNSDictinoaryListOfBoards [boardNo][@"description"];
    NSString *boardScore =objNSDictinoaryListOfBoards [boardNo][@"score"];
    NSString *boardSize =objNSDictinoaryListOfBoards [boardNo][@"size"];
    NSString *boardId =[objNSDictinoaryListOfBoards valueForKey:@"myKey"][indexPath.row];
    //NSString *boardSid =objNSDictinoaryListOfBoards [boardNo][@"key"];


    cell.textLabel.text=boardName;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController_Update_Boards *vc = (ViewController_Update_Boards *)[sb instantiateViewControllerWithIdentifier:@"ViewController_Update_Boards"];
//    NSString *boardId =[objNSDictinoaryListOfBoards valueForKey:@"myKey"][indexPath.row];
        NSString *boardNo =[objNSDictinoaryListOfBoards allKeys][indexPath.row];
        vc.boardName = objNSDictinoaryListOfBoards[boardNo][@"name"];
        vc.boardBrand = objNSDictinoaryListOfBoards[boardNo][@"brand"];
        vc.boardDescription = objNSDictinoaryListOfBoards[boardNo][@"description"];
        vc.boardScore = objNSDictinoaryListOfBoards[boardNo][@"score"];
        vc.boardSize = objNSDictinoaryListOfBoards[boardNo][@"size"];
        //vc.boardId =[objNSDictinoaryListOfBoards valueForKey:boardNo];
        vc.boardId =boardNo;




        [self.navigationController pushViewController:vc animated:TRUE];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
