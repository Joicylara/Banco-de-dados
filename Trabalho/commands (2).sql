--tem que ficar na ordem da compilacao
create table marca(
id_marca integer primary key,
nome_marca varchar(20) not null,
ativo_marca boolean not null,
created_at_marca date,
updated_at_ date
);

create table produto(
id_produto integer primary key,
nome_produto varchar(20) not null,
descricao_produto text not null,
valor_produto numeric(5,2) not null,
id_marca integer not null,
foreign key(id_marca) references marca (id_marca),
desconto_produto numeric(5,2),
created_at_produto date,
updated_at_produto date
);

create table categoria(
id_categoria integer primary key,
nome_categoria varchar(20) not null,
ativo_categoria boolean not null,
id_categorias integer not null,
foreign key (id_categorias) references categoria(id_categoria),
created_at_categoria date,
updated_at_categoria date
);

create table tamanho(
id_tamanho integer primary key,

);

create table produto_tamanho(
id_produto_tamanho integer primary key,
quantidade bigint not null,
id_tamanho integer not null,
foreign key (id_tamanho) references tamanho(id_tamanho),
id_produto integer not null,
foreign key (id_produto) references produto(id_produto),
ativo_produto_tamanho boolean not null,
created_at_produto_tamanho date,
updated_at_produto_tamanho date

);


\d