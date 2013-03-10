//
//  FirstViewController.h
//  Atendimento
//
//  Created by Peterson Tamarindo on 07/03/13.
//  Copyright (c) 2013 Foka Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *labelFuncionario;
@property (strong, nonatomic) IBOutlet UITextField *labelCliente;
@property (strong, nonatomic) IBOutlet UITextField *labelTelefone;
@property (strong, nonatomic) IBOutlet UITextField *labelProblema;
@property (strong, nonatomic) IBOutlet UITextField *labelSolucao;
@property (strong, nonatomic) IBOutlet UILabel *labelResultado;
- (IBAction)inserirDados:(id)sender;
- (IBAction)recuarTelcado;

@end
