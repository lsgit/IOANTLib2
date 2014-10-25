//
//  IOANTUploadURLRequest.h
//  02.Post上传
//
//  Created by liushuai on 14-10-24.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOANTUploadURLRequest : NSMutableURLRequest
@property(nonatomic,readonly,retain)NSString *randomStr;
@property(nonatomic,readonly,retain)NSMutableData *requestDataM;
-(void)addFileByName:(NSString *)name withContentType:(NSString *)contentType upLoadID:(NSString *)uploadID andData:(NSData *)data;
-(id)initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval randomStr:(NSString *)randomStr;
-(void)addFinished;
@end
/*// 255216 jpg;
 // 7173 gif;
 // 6677 bmp,
 // 13780 png;
 // 6787 swf
 // 7790 exe dll,
 // 8297 rar
 // 8075 zip
 // 55122 7z
 // 6063 xml
 // 6033 html
 // 239187 aspx
 // 117115 cs
 // 119105 js
 // 102100 txt
 // 255254 sql
 在ios中用OC代码进行如下操作：
 
 
 NSString *path = [[NSBundlemainBundle] pathForResource:@"READ"ofType:@"zip"];
 
 NSData *d = [NSDatadataWithContentsOfFile:path];
 
 if (data.length<2) {
 
 return  @"NOT FILE";
 
 }
 
 
 int char1 = 0 ,char2 =0 ; //必须这样初始化
 
 [data getBytes:&char1 range:NSMakeRange(0, 1)];
 
 [data getBytes:&char2 range:NSMakeRange(1, 1)];
 
 NSLog(@"%d%d",char1,char2);
 
 NSString *numStr = [NSStringstringWithFormat:@"%i%i",char1,char2];*/
