//
//  LWPlaceHolderReplace.m
//  CodeView
//
//  Created by 李伟 on 16/11/14.



#import <UIKit/UIKit.h>
@class LWPlaceHolderReplace;
@protocol LWPlaceHolderReplaceDelagate <NSObject>
@required
-(void)lwValidteCodeDidInput:(LWPlaceHolderReplace *)codeView withCode:(NSString *)code;

@end

@interface LWPlaceHolderReplace : UIView
@property(nonatomic,weak) id <LWPlaceHolderReplaceDelagate>delegate;
@end
