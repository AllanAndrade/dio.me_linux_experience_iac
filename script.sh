#!/bin/bash
# #########################################################################################################
# Dio.me
# Bootcamp: Linux Experience
# Atividade: Script de Criação de Estrutura de Usuários, Diretórios e Permissões
# #########################################################################################################
# DEFINIÇÕES
# - Excluir diretórios, arquivos, grupos e usuários criados anteriormente;
# - Todo provisionamento deve ser feito em um arquivo do tipo Bash Script;
# - O dono de todos os diretórios criados será o usuário root;
# - Todos os usuários terão permissão total dentro do diretório publico;
# - Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
# - Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem;
# - Subir arquivo de script criado para a sua conta no GitHub.
# #########################################################################################################
echo ""
echo "Início da execução do script"
echo ""
####################################################
# Parâmetros
####################################################
# ADM
ADM_PASTA="/adm"
ADM_GRUPO="GRP_ADM"
ADM_USERS=("carlos" "maria" "joao")
#
# VEN
VEN_PASTA="/ven"
VEN_GRUPO="GRP_VEN"
VEN_USERS=("debora" "sebastiana" "roberto")
#
# SEC
SEC_PASTA="/sec"
SEC_GRUPO="GRP_SEC"
SEC_USERS=("josefina" "amada" "rogerio")
#
# PUBLIC
PUB_PASTA="/publico"
#
#
####################################################
# Excluir itens criados anteriormente
####################################################
#
# Excluir diretórios / arquivos
diretorios=($PUB_PASTA $ADM_PASTA $VEN_PASTA $SEC_PASTA)
for str in ${diretorios[@]}; do
    rm -rf $str
done
#
# Excluir grupos
grupos=($ADM_GRUPO $VEN_GRUPO $SEC_GRUPO)
for str in ${grupos[@]}; do
    groupdel -f $str
done
#
# Excluir usuários
for str in ${ADM_USERS[@]}; do
    userdel -f -r $str
done
for str in ${VEN_USERS[@]}; do
    userdel -f -r $str
done
for str in ${SEC_USERS[@]}; do
    userdel -f -r $str
done
#
#
####################################################
# Grupos
####################################################
for str in ${grupos[@]}; do
    groupadd -f $str
done
#
#
####################################################
# Pastas
####################################################
# Criar
for str in ${diretorios[@]}; do
    mkdir $str
done
# Configura /publico
chown root:root $PUB_PASTA
chmod 777 $PUB_PASTA
# Configura /adm
chown root:$ADM_GRUPO $ADM_PASTA
chmod 770 $ADM_PASTA
# Configura /ven
chown root:$VEN_GRUPO $VEN_PASTA
chmod 770 $VEN_PASTA
# Configura /sec
chown root:$SEC_GRUPO $SEC_PASTA
chmod 770 $SEC_PASTA
#
#
####################################################
# Usuários
####################################################
for str in ${ADM_USERS[@]}; do
    useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha10) -G $ADM_GRUPO $str
done
for str in ${VEN_USERS[@]}; do
    useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha10) -G $VEN_GRUPO $str
done
for str in ${SEC_USERS[@]}; do
    useradd -m -s /bin/bash -p $(openssl passwd -crypt Senha10) -G $SEC_GRUPO $str
done
#
#
echo ""
echo "Fim da execução do script"
echo ""
