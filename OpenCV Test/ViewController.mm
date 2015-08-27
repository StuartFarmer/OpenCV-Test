//
//  ViewController.m
//  OpenCV Test
//
//  Created by Stuart Farmer on 8/25/15.
//  Copyright (c) 2015 Stuart Farmer. All rights reserved.
//

#import "ViewController.h"

#import <opencv2/opencv.hpp>
#import <opencv2/videoio/cap_ios.h>
#import <opencv2/objdetect/objdetect.hpp>
#import <opencv2/imgproc/imgproc_c.h>

using namespace cv;

@interface ViewController () <CvVideoCameraDelegate, UIGestureRecognizerDelegate> {
    CvVideoCamera *videoCamera;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set up the CV Video Camera object to bring in video to the program
    videoCamera = [[CvVideoCamera alloc] initWithParentView:self.imageView];
    videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionBack;
    videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPresetHigh;
    videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    videoCamera.defaultFPS = 30;
    videoCamera.grayscaleMode = NO;
    videoCamera.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma CvVideoCameraDelegate Methods

-(void)processImage:(cv::Mat &)image {
    // Do some OpenCV stuff with the image
    Mat image_copy = image;
    cvtColor(image_copy, image, CV_16S);
}

- (IBAction)startCamera:(id)sender {
    if (!videoCamera.running) [videoCamera start];
    else [videoCamera stop];
}
@end
