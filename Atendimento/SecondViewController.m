//
//  SecondViewController.m
//  Atendimento
//
//  Created by Peterson Tamarindo on 07/03/13.
//  Copyright (c) 2013 Foka Tech. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize auxCliente, auxFuncionario, auxNumero, auxProblema, auxSolucao, auxTelefone;
@synthesize numero, cliente, funcionario, problema, telefone, solucao;

- (void)viewDidLoad
{
    
    numero.text = auxNumero;
    cliente.text = auxCliente;
    funcionario.text = auxFuncionario;
    telefone.text = auxTelefone;
    problema.text = auxProblema;
    solucao.text = auxSolucao;
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
