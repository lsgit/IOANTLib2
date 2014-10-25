//
//  IOANTFileType.h
//  PostDemo1
//
//  Created by liushuai on 14-10-25.
//  Copyright (c) 2014年 Liushuai. All rights reserved.
///* 255216 jpg;
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
 // 7368 mp3*/

#import <Foundation/Foundation.h>
typedef enum
{
    IOANTFileTypePNG = 13780,
    IOANTFileTypeJPG = 255216,
    IOANTFileTypeGIF = 7173,
    IOANTFileTypeMP3 = 7368,
    IOANTFileTypeRAR = 8297,
    IOANTFileTypeZIP = 8075,
    IOANTFileTypeBMP = 6677,
    IOANTFileTypeHTML = 6033,
    IOANTFileType7z = 55122,
    IOANTFileTypeXML = 6063,
    IOANTFileTypeTXT = 102100,
    IOANTFileTypeNOTSupport = 93041010,
    IOANTFileTypeNOTFile = 19930410
}IOANTFileTypeResult;
@interface IOANTFileType : NSObject
+(NSString *)getFileMineTypeByData:(NSData *)data;
@end
