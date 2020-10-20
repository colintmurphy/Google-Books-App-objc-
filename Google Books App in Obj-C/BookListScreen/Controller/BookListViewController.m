//
//  BookListViewController.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import "Book.h"
#import "BookListViewController.h"
#import "BookTableViewCell.h"
#import "BookImageInfo.h"
#import "NetworkManager.h"
#import "VolumeInfo.h"

@interface BookListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation BookListViewController {
    
    NSMutableArray<Book *> *dataSource;
    NSString *cellId;
}

// MARK: - View Life Cycles

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setup];
}

// MARK: - Methods

- (void)getDataFromServer {
    
    [self.activityIndicator startAnimating];
    NSString *urlString = @"https://www.googleapis.com/books/v1/volumes?q=coding";
    [[NetworkManager shared] requestWithUrl:urlString completion:^(NSMutableArray<Book *> *_Nullable data, NSError *_Nullable error) {
       
        if (data) {
            [self->dataSource removeAllObjects];
            [self->dataSource addObjectsFromArray:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->_tableView reloadData];
                [self->_activityIndicator stopAnimating];
            });
        } else if (error) {
            NSLog(@"Returned an error at requestWithUrl");
            [self->_activityIndicator stopAnimating];
        }
    }];
}

- (void)setup {
    
    self.navigationItem.title = @"Google Books";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    cellId = @"BookTableViewCell";
    dataSource = [[NSMutableArray alloc] init];
    
    [self.activityIndicator setHidesWhenStopped:YES];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    [self getDataFromServer];
}

// MARK: - TableView Datasource

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    BookTableViewCell *cell = (BookTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[BookTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }

    [cell setInfo:dataSource[indexPath.row].volumeInfo.title withImageUrlString:dataSource[indexPath.row].volumeInfo.imageInfo.thumbNail];
    
    return cell;
}

// MARK: - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
