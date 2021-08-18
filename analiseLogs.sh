#!/bin/bash

echo "Qual o nome do arquivo a ser analisado (coloque a extensão também)?"
read arquivo
echo " "

###### PARTE DE EXIBIÇÃO DO MENU DE OPÇÕES

echo "------ MENU DE OPÇÕES -------"
echo " "
echo "1) Visualizar todas as conexões de um range de IP especifico de origem"
echo "----------"
echo "2) Visualizar todas as conexões de um range de IP especifico de destino."
echo "----------"
echo "3) Visualizar todas as conexões em uma porta especifica."
echo "----------"
echo "4) Visualizar todas as conexões externas que não esteja no range da empresa"
echo "----------"
echo " "
echo " "
######### INICIO DO PROCESSAMENTO DAS INFORMAÇÕES UTILIZANDO O SWITCH

echo "Por gentileza, escolha uma das opções do menu De opções (insira apenas o numero desejado): "
read opcao

case $opcao in

1)
echo "Informe o range de IP referete a origem: "
read ip
echo "=========="


sort -n $arquivo | uniq -c | sort -n | egrep ^$ip $arquivo |  head -n20
echo " "

##criar um IF para verificar se a pessoa quer exportar as info para um arquivo.
;;

2)
echo "Informe o IP de destino: "
read ip

sort -n $arquivo | uniq -c | sort -n | egrep " $ip" $arquivo | head -n20;;


3)
echo "Informe o numero da porta: "
read porta
echo "=========="
sort -n $arquivo | uniq -c | sort -n | egrep " $porta " $arquivo | head -n20;;

4)
echo "Informe o IP interno para analisar as conexões externas: "
read ip

sort -n $arquivo | uniq -c | sort -n | egrep " $ip" $arquivo | egrep -v "(^10.0.0*|10.50.0*|192.168.0*|24.223.148*|26.66.77*|60.142.8* )" $arquivo | head -n20

;;

4);;

5);;













*)i
echo "opção invalida"
;;



esac
