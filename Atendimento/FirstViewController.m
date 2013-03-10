//
//  FirstViewController.m
//  Atendimento
//
//  Created by Peterson Tamarindo on 07/03/13.
//  Copyright (c) 2013 Foka Tech. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize labelCliente, labelFuncionario, labelProblema, labelResultado, labelSolucao, labelTelefone;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inserirDados:(id)sender {
    NSMutableString *stringURL = [[NSMutableString alloc] initWithFormat:@"http://127.0.0.1/insereAtendimento.php?nomeFunc=%@&nomeCt=%@&telefone=%@&problema=%@&solucao=%@",labelFuncionario.text, labelCliente.text, labelTelefone.text, labelProblema.text, labelSolucao.text ];
    
    [stringURL setString:[stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringURL]];
    NSMutableString *stringResult = [[NSMutableString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    labelResultado.text = stringResult;
    [self apagarDados];
   
    
}

-(void) apagarDados{
    
    labelFuncionario.text = nil;
    labelCliente.text = nil;
    labelTelefone.text = nil;
    labelProblema.text = nil;
    labelSolucao.text = nil;
    
}


- (IBAction)recuarTelcado{
    
    [labelFuncionario resignFirstResponder];
    [labelCliente resignFirstResponder];
    [labelTelefone resignFirstResponder];
    [labelProblema resignFirstResponder];
    [labelSolucao resignFirstResponder];
    
    
}

@end
