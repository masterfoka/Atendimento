//
//  SecondViewController.h
//  Atendimento
//
//  Created by Peterson Tamarindo on 07/03/13.
//  Copyright (c) 2013 Foka Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController{
    NSString *auxNumero;
    NSString *auxFuncionario;
    NSString *auxCliente;
    NSString *auxTelefone;
    NSString *auxProblema;
    NSString *auxSolucao;
    
}
@property (strong, nonatomic) IBOutlet UILabel *numero;
@property (strong, nonatomic) IBOutlet UILabel *funcionario;
@property (strong, nonatomic) IBOutlet UILabel *cliente;
@property (strong, nonatomic) IBOutlet UILabel *telefone;
@property (strong, nonatomic) IBOutlet UILabel *problema;
@property (strong, nonatomic) IBOutlet UILabel *solucao;


@property NSString *auxNumero;
@property NSString *auxFuncionario;
@property NSString *auxCliente;
@property NSString *auxTelefone;
@property NSString *auxProblema;
@property NSString *auxSolucao;

@end
