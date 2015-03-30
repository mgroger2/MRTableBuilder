//
//  MRTableRow.m
//  MRTableBuilder
//
//  Created by Martin Rybak on 3/11/15.
//  Copyright (c) 2015 Martin Rybak. All rights reserved.
//

#import "MRTableRow.h"
#import "MRTableSection.h"
#import "MRTableBuilder.h"

@implementation MRTableRow

- (instancetype)initWithNib:(UINib*)nib reuseIdentifier:(NSString*)reuseIdentifier
{
	if (self = [super init]) {
		_cellNib = nib;
		_reuseIdentifier = reuseIdentifier;
	}
	return self;
}

- (instancetype)initWithClass:(Class)class reuseIdentifier:(NSString*)reuseIdentifier
{
	if (self = [super init]) {
		_cellClass = class;
		_reuseIdentifier = reuseIdentifier;
	}
	return self;
}

- (instancetype)initWithReuseIdentifier:(NSString*)reuseIdentifier
{
	if (self = [super init]) {
		_cellClass = [UITableViewCell class];
		_reuseIdentifier = reuseIdentifier;
	}
	return self;
}

- (instancetype)init
{
	if (self = [super init]) {
		_cellClass = [UITableViewCell class];
		_reuseIdentifier = [UITableViewCell description];
	}
	return self;
}

- (UITableViewCell*)buildCellWithIndexPath:(NSIndexPath*)indexPath
{
	UITableViewCell* cell = [self.section.tableBuilder.tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier forIndexPath:indexPath];
	[self configureCell:cell];
	return cell;
}

- (UITableViewCell*)buildCell
{
	UITableViewCell* cell = [self.section.tableBuilder.tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
	[self configureCell:cell];
	return cell;
}

- (void)configureCell:(UITableViewCell*)cell
{
	if (self.onConfigure) {
		self.onConfigure(cell);
	}
}

@end
