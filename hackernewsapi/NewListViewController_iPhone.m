//
//  NewListViewController_iPhone.m
//  hackernewsapi
//
//  Created by Guillaume Garcera on 03/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewListViewController_iPhone.h"
#import "HNItem.h"

@implementation NewListViewController_iPhone


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    HNItem *item = [self.headlines objectAtIndex:indexPath.row];
    if (item.type == HNArticle)
        cell.imageView.image = [UIImage imageNamed:@"article_32x32"];
    else
        cell.imageView.image = [UIImage imageNamed:@"comment_alt2_stroke_32x24"];
    cell.textLabel.text = item.title;

    
    //cell.textLabel.text = @"Vertical Table Rows on iPhone";
    
    return cell;
}

@end
