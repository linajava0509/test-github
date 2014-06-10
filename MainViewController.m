//
//  MainViewController.m
//  janken_game
//
//  Created by LI NA on 2012/11/17.
//  Copyright (c) 2012年 LI NA. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

/*******20121117 START*******/

@synthesize btn_gu, btn_tyoki, btn_pa, btn_again;
@synthesize lbl_mes, lbl_kekka, qite_img;

UIImage *gu_img;
UIImage *ch_img;
UIImage *pa_img;


-(IBAction)btn_gu_down:(id)sender{
    self.lbl_mes.text = @"じゃんけん・・・ぽんっ！";
    
    self.btn_tyoki.hidden = YES;
    self.btn_pa.hidden = YES;
    self.btn_again.hidden = NO;
    
    srand(time(nil));
    NSInteger kekka;
    kekka = rand()% 3;
    
    if(kekka == 0){
        //self.qite.text = @"ぐー";
        self.qite_img.image = gu_img;
    }else if(kekka == 1){
        //self.qite.text = @"ちょきー";
        self.qite_img.image = ch_img;
    }else{
        //self.qite.text = @"ぱー";
        self.qite_img.image = pa_img;
    }
    
    if(kekka == 0){
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_tyoki.hidden = NO;
        self.btn_pa.hidden = NO;
        self.btn_again.hidden = YES;
    }else if(kekka == 1){
        self.lbl_kekka.text = @"あなたのかち！";
        self.btn_gu.enabled = NO;
    }else{
        self.lbl_kekka.text = @"あなたのまけ！";
        self.btn_gu.enabled = NO;
    }
    
}


-(IBAction)btn_tyoki_down:(id)sender{
    self.lbl_mes.text = @"じゃんけん・・・ぽんっ！";
    
    self.btn_gu.hidden = YES;
    self.btn_pa.hidden = YES;
    self.btn_again.hidden = NO;

    srand(time(nil));
    NSInteger kekka;
    kekka = rand()% 3;
    
    if(kekka == 0){
        //self.qite.text = @"ぐー";
        self.qite_img.image = gu_img;
    }else if(kekka == 1){
        //self.qite.text = @"ちょきー";
        self.qite_img.image = ch_img;
    }else{
        //self.qite.text = @"ぱー";
        self.qite_img.image = pa_img;
    }
    
    if(kekka == 0){
        self.lbl_kekka.text = @"あなたのまけ！";
        self.btn_tyoki.enabled = NO;
    }else if(kekka == 1){
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_gu.hidden = NO;
        self.btn_pa.hidden = NO;
        self.btn_again.hidden = YES;
    }else{
        self.lbl_kekka.text = @"あなたのかち！";
        self.btn_tyoki.enabled = NO;
    }
    
}


-(IBAction)btn_pa_down:(id)sender{
    self.lbl_mes.text = @"じゃんけん・・・ぽんっ！";
    
    self.btn_gu.hidden = YES;
    self.btn_tyoki.hidden = YES;
    self.btn_again.hidden = NO;
    
    srand(time(nil));
    NSInteger kekka;
    kekka = rand()% 3;
    
    if(kekka == 0){
        //self.qite.text = @"ぐー";
        self.qite_img.image = gu_img;
    }else if(kekka == 1){
        //self.qite.text = @"ちょきー";
        self.qite_img.image = ch_img;
    }else{
        //self.qite.text = @"ぱー";
        self.qite_img.image = pa_img;
    }
    
    if(kekka == 0){
        self.lbl_kekka.text = @"あなたのかち！";
        self.btn_pa.enabled = NO;
    }else if(kekka == 1){
        self.lbl_kekka.text = @"あなたのまけ！";
        self.btn_pa.enabled = NO;
    }else{
        self.lbl_kekka.text = @"あいこで・・・";
        self.btn_gu.hidden = NO;
        self.btn_tyoki.hidden = NO;
        self.btn_again.hidden = YES;
    }

}

-(IBAction)btn_again_down:(id)sender{
    self.btn_gu.hidden = NO;
    self.btn_gu.enabled = YES;
    self.btn_tyoki.hidden = NO;
    self.btn_tyoki.enabled = YES;
    self.btn_pa.hidden = NO;
    self.btn_pa.enabled = YES;
    
    self.btn_again.hidden = YES;
    self.lbl_mes.text = @"じゃんけん・・・！";
    self.lbl_kekka.text = @"";
    //self.qite_img.image =
}



/*******20121117 END*******/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    /*******20121117 START*******/
    self.lbl_kekka.text = @"";
    self.lbl_kekka.font = [UIFont boldSystemFontOfSize:30];
    self.lbl_kekka.textColor = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    //self.qite.text = @"";

    self.btn_again.hidden = YES;
    
    gu_img = [UIImage imageNamed:@"gu.png"];
    ch_img = [UIImage imageNamed:@"ch.png"];
    pa_img = [UIImage imageNamed:@"pa.png"];
    
    /*******20121117 END*******/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
