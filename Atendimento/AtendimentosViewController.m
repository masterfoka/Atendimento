//
//  AtendimentosViewController.m
//  Atendimento
//
//  Created by Peterson Tamarindo on 09/03/13.
//  Copyright (c) 2013 Foka Tech. All rights reserved.
//

#import "AtendimentosViewController.h"
#import "SecondViewController.h"

@interface AtendimentosViewController ()

@end



@implementation AtendimentosViewController


- (void) getData{
    NSMutableString *strURL = [[NSMutableString alloc] initWithFormat:@"http://127.0.0.1/buscaAtendimento.php?"];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    //o metodo dataWithContentsURL executa a URL e ja guarda o seu retorno no ponteiro data
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //agora é necessário tratar o retorno data
    
    NSError *erro;
    
    //cada linha de retorno do JSON ( que esta entre {}) é retornado como um objeto para dentro do array
    //ou seja, se a tabela possuir 10 linhas, haverao 10 objetos JSON dentro do array
    //O objeto JSON pode ser traduzido como um NSDictionary pelo Objective-C
    listaAtendimentos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&erro];
 
}

- (void) removeData:(NSString *) numeroAtendimento{
    
    NSMutableString *strURL = [[NSMutableString alloc] initWithFormat:@"http://127.0.0.1/removeAtendimento.php?numero=%i",[numeroAtendimento intValue]];
    
    NSURL *url = [NSURL URLWithString:strURL];
    
    //o metodo dataWithContentsURL executa a URL e ja guarda o seu retorno no ponteiro data
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //agora é necessário tratar o retorno data
    NSMutableString *stringResult = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"Mensagem Resultado %@", stringResult);

    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//O metodo didViewLoad é executado apenas na primeira vez que o botao do Tab é clicado
//Por isso é necessario implementar o metodo viewWillAppear, que roda sempre que o Tab é clicado

-(void) viewWillAppear:(BOOL)animated{
    [self getData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listaAtendimentos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Configura o Estilo da Celula
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
     //O objeto JSON pode ser traduzido como um NSDictionary pelo Objective-C
    NSDictionary *atendimento = [listaAtendimentos objectAtIndex:indexPath.row];
    cell.textLabel.text = [atendimento objectForKey:@"nomecliente"];
    cell.detailTextLabel.text = [atendimento objectForKey:@"numero"];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
 
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *aux = [listaAtendimentos objectAtIndex:indexPath.row];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self removeData:[aux objectForKey:@"numero"]];
        [self getData];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    //Garantir a navegacao para a view atendimento. Primeiro instancia-se um objeto para apontar qual storyboard a view se encontra
    //Depois instanca-se a view que queremos carregar, passando o nome dela como parametro
    // depois executa o metodo que ira carregar a view, passando como parametro o objeto da view criado acima
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SecondViewController *atendimento = [storyboard instantiateViewControllerWithIdentifier:@"viewAtendimento"];
    
    NSDictionary *aux = [listaAtendimentos objectAtIndex:indexPath.row];
    
    
    atendimento.auxNumero = [aux objectForKey:@"numero"];
    atendimento.auxFuncionario = [aux objectForKey:@"nomefuncionario"];
    atendimento.auxCliente = [aux objectForKey:@"nomecliente"];
    atendimento.auxTelefone = [aux objectForKey:@"telefone"];
    atendimento.auxProblema = [aux objectForKey:@"problema"];
    atendimento.auxSolucao = [aux objectForKey:@"solucao"];
    
    [atendimento setTitle:@"Dados do Atendimento"];
    
    NSLog(@"%@", [ listaAtendimentos objectAtIndex:indexPath.row]);
    
    
    [self.navigationController pushViewController:atendimento animated:YES];
    
    
     
}

@end
