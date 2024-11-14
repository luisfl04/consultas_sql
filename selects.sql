-- Arquivo destinado a exemplos de consultas com SQL.   

-- Agrupando uma coluna e fazendo a contagem de valores por grupo:
select dept_no, count(*) as total_por_departamento
from dept_manager
group by dept_no;

-- Fazendo contágem única de valores, sem considerar valores duplos:
select count(distinct dept_no) as contagem_de_departamentos_que_aparecem
from dept_manager;

-- Agrupando uma coluna e somando todos os valores dessa coluna agrupada:
select emp_no, sum(salary) as soma_dos_salarios_recebidos_por_um_empregado
from salaries
group by emp_no;

/* Obtendo a média dos valores de uma determinada coluna numérica com 'AVG()' e formatando
 o valor de resultado com 'format()' */
select emp_no, format(avg(salary), 2) as media_dos_salarios_por_empregado
from salaries
group by emp_no; 

-- Obtendo o maior e o menor valor de uma coluna agrupada: 
select emp_no,
max(salary) as maior_salario, 
min(salary) as menor_salario
from salaries
group by emp_no;

-- Concatenação de valores:
select concat_ws('-', first_name, last_name)
as nome_completo_do_empregado
from employees;

select concat('nome -> ', first_name, ' --- sobrenome -> ', last_name)
as nome_completo_do_empregado
from employees;

-- inserindo valores a partir de uma sub-consulta:
insert into professor(pessoa_id)
select id_pessoa from pessoa;

-- selecionando ultimos dois valores de uma string:
select substring(nome, -2, 2) from pessoa;

-- fazendo substituição de um valor de uma string com 'replace()':
select replace(nome, "Ana", "luis") 
as nome_corrigido
from pessoa;

-- Fazendo a seleção de valores dentro de um interva-lo de datas:
select * from employees
where hire_date >= date_sub(now(), interval 25 year);

-- Selecionando os dias de vida que determinado objeto tem usando a 'datediff()':
select concat_ws('', first_name, last_name), 
birth_date as data_de_nascimento,
datediff(curdate(), birth_date) as dias_de_vida
from employees;

-- Fazendo condicionais com 'if()':
select emp_no,
if(first_name like('g%'), 'o nome começa com g', 'o nome não começa com g') as verificação_nome
from employees;

-- Comparação múltipla de valores usando case:
select 
	case gender 
		when 'M' then 'Homem'
        when 'F' then 'Mulher'
        else 'Não informado'
	end as sexualidade
from employees;






