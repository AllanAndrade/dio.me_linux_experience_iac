# Bootcamp Linux Experience (dio.me)
## Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões

### Requisitos:
- [x] Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
- [x] Todo provisionamento deve ser feito em um arquivo do tipo Bash
Script;
- [x] O dono de todos os diretórios criados será o usuário root;
- [x] Todos os usuários terão permissão total dentro do diretório publico;
- [x] Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
- [x]  Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
Subir arquivo de script criado para a sua conta no GitHub.

### Uso:
- `git clone git@github.com:AllanAndrade/dio.me_linux_experience_iac.git`
- `cd dio.me_linux_experience_iac`
- `chmod +x script.sh`
- `sudo ./script.sh`

### Melhorias em relação ao apresentado no curso:
- Organização do código a fim de facilitar alterações necessárias, como por exemplo inclusão ou exclusão de usuários.