/*FUN??ES S?O OPERA??ES EM CONSULTAS.
VAMOS COME?AR COM OPERA??ES EM VARCHARS(STRINGS)
NA ORDEM TEMOS: UPPER - DEIXAR TUDO MAI?SCULOS. LOWER - TUDO MIN?SCULO. 
INITCAP - DEIXA A PRIMEIRA LETRA MAI?SCULA 
CONCAT - CONCATENA*/
SELECT NOME, UPPER(NOME), LOWER(NOME), INITCAP(NOME),
CONCAT(ENDERECO_1,BAIRRO)
FROM TABELA_DE_CLIENTES;

/*OUTRA FORMA DE CONCATENAR*/
SELECT NOME, 'ENDERE?O:' || ENDERECO_1 || ' ' || BAIRRO||' '||CIDADE||' '|| ESTADO ||' '||'CEP:' || CEP AS ENDERE?O_COMPLETO
FROM TABELA_DE_CLIENTES;

/*O LPAD E O RPAD COMPLETRA O VARCHAR COM CARACTERES AT? O VARCHAR INTEIRO TER UMA QUANTIADE
DE CARACTERES ESPECIFICADO. A DIFEREN?A ? QUE LPAD COMPLETRA A ESQUERDA E RPAD COMPLETA A DIREITA.*/
SELECT NOME, LPAD(NOME,25, '*') FROM TABELA_DE_CLIENTES;

/*O SUBSTR SELECIONA UMA FAIXA DE CARACTERES A SE PEGAR
ENQUANTO O INSTR PROCURA A PRIMEIRA POSI??O DA LETRA PEDIDA*/
SELECT NOME, SUBSTR(NOME, 2,6), INSTR(NOME, 'a') FROM TABELA_DE_CLIENTES;

/*O RTRIM E O LTRIM RETORNA O VARCHAR CORTANDO ESPA?OS EM BRANCO.
O DUAL SERVE PARA ESPECIFICAR QUE N?O ? NENHUMA TABELA QUE QUERO*/
SELECT LTRIM('          OL?'), RTRIM('HELLO WORLD    ') FROM DUAL;

/*REPLACE APRESENTA O VARCHAR TROCADO POR ALGO QUE EU QUERO*/
SELECT NOME_DO_PRODUTO, REPLACE(NOME_DO_PRODUTO, 'Litro','L') FROM TABELA_DE_PRODUTOS;

/*--------------------------------------------------------------------------------------*/
/*FUN??ES DO TIPO DATA*/
/*SYSDATE DEVOLVE O DIA ATUAL E O TO_CHAR PERMITE COM QUE EU ESPECIFIQUE COMO QUERO A DATA*/
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MM:SS')AS DATA FROM DUAL;
/*A SOMA, SUBTRA??O ? DADA POR DIAS*/
SELECT SYSDATE+10 FROM DUAL;
/*MONTHS_BETWEEN MOSTRA A DIFEREN?A ENTRE DUAS DATAS.
TO DATE TRANSFORMA O VARCHAR EM DATA*/
SELECT MONTHS_BETWEEN(TO_DATE(' 2023/01/01','YYYY-MM-DD'),SYSDATE) FROM DUAL;

/*ADD_MONTHS SOMA DATAS*/
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;

/*NEXT_RETORNA QUAL ? O PROXIMO DIA DA SEMANA
LAST_DAY RETORNA ?LTIMA DIA DO MEU M?S*/
SELECT NEXT_DAY(SYSDATE, 'TER?A'), LAST_DAY(SYSDATE) FROM DUAL;
/*O TRUNC RETORNA O PRIMEIRO DIA DE UM PAR?METRO, E O ROUND ARREDONDA*/
SELECT TRUNC(SYSDATE,'YEAR'), ROUND(SYSDATE, 'MONTH') FROM DUAL;

SELECT NOME, MONTHS_BETWEEN (SYSDATE, DATA_DE_NASCIMENTO)/12 AS IDADE
FROM tabela_de_clientes;

/*--------------------------------------------------------------------*/
/*FUN??ES MATEM?TICAS*/
/*ROUND ARRENDONDA VALORES FLOAT.
O CEIL ARREDONDA SEMPRE PRA CIMA.
FLOOR ARREDONDA SEMPRE PARA BAIXO.
POWER ELEVA A UMA POTENCIA
EXP ? O EXPONENCIAL DE A UM N?MERO
SQRT ? RAIZ*/
SELECT PRECO_DE_LISTA, ROUND(PRECO_DE_LISTA,2),
CEIL(PRECO_DE_LISTA), FLOOR(PRECO_DE_LISTA) ,
POWER(PRECO_DE_LISTA,2), EXP(PRECO_DE_LISTA),
SQRT(PRECO_DE_LISTA) FROM TABELA_DE_PRODUTOS;

/*ABS ? O M?DULO DE UM VALOR.
SIGN RETORNA O SINAL DO VALOR
MOD RETORNA O RESTO DA DIVIS?O*/
SELECT ABS(-10), SIGN(-1), MOD(10,6) FROM DUAL;

SELECT TO_CHAR(DATA_VENDA, 'YYYY'), FLOOR(SUM(IMPOSTO*QUANTIDADE*PRECO)) AS IMPOSTO FROM 
NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO
WHERE TO_CHAR(DATA_VENDA, 'YYYY')= 2016
GROUP BY  TO_CHAR(DATA_VENDA, 'YYYY');


/*-----------------------------------------------------------------------------------*/
/*FUN??ES DE CONVERS?O*/
/*TO_DATE TRANSFORMA STRING EM DATA; TO_CHAR TRANSFORMA EM STRING.
AMBOS DEVEM SER ESPECIFICADO COMO DEVER? SER MOSTRADO.
EXTRACT PEGA UM TERMO DA DATA, E DEVE SER ESPECIFICA O QUE QUER.*/

SELECT TO_DATE('12/11/1999', 'DD/MM/YYYY'), TO_CHAR(SYSDATE, 'MM/DD/YYYY'),
EXTRACT(MONTH FROM SYSDATE) FROM DUAL;

/*TO NUMBER PEGA UMA STRING E TRANSFORMAR EM N?MERO.
NVL TRANSFORMA NULO EM ALGO DESEJADO.
GREATEST MOSTRA O MAIOR VALOR.*/
SELECT TO_NUMBER('110') + 100,
NVL(NULL, 10),
GREATEST (10,25,3) FROM DUAL;

SELECT DISTINCT 'CLIENTE '||NOME || ' FATUROU', SUM(QUANTIDADE*PRECO) AS FATURAMENTO FROM
(SELECT * FROM NOTAS_FISCAIS A INNER JOIN ITENS_NOTAS_FISCAIS B
ON A.NUMERO = B.NUMERO)C INNER JOIN TABELA_DE_CLIENTES D
ON C.CPF = D.CPF WHERE TO_CHAR(DATA_VENDA,'YYYY') = 2016
GROUP BY NOME;





