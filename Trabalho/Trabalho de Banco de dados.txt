--Criação das tabelas
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
nome_tamanho varchar(20) not null,
grupo_tamanho varchar(20) not null,
ativo_tamanho boolean not null,
created_at_tamanho date,
updated_at_tamanho date
);

create table produto_tamanho(
id_produto_tamanho integer primary key,
quantidade_produto_tamanho bigint not null,
id_tamanho integer not null,
foreign key (id_tamanho) references tamanho(id_tamanho),
id_produto integer not null,
foreign key (id_produto) references produto(id_produto),
ativo_produto_tamanho boolean not null,
created_at_produto_tamanho date,
updated_at_produto_tamanho date

);

create table usuario(
id_usuario integer primary key not null,
nome_usuario varchar(20) not null,
email_usuario varchar(40) not null,
telefone_usuario varchar(20) not null,
data_nascimento_usuario date not null,
id_externo_usuario varchar(20) not null,
genero_usuario varchar(20) not null,
senha_usuario varchar(20) not null,
created_at_usuario date,
updated_at_usuario date,
ativo_usuario boolean not null
);

create table vendedor(
id_vendedor integer primary key,
nome_vendedor varchar(20) not null,
cpf_vendedor varchar(20) not null,
cnpj_vendedor varchar(20),
id_externo_vendedor varchar(20) not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
created_at_vendedor date,
updated_at_vendedor date,
ativo_vendedor boolean not null
);


create table gostar(
id_gostar integer primary key,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
id_produto integer not null,
foreign key (id_produto) references produto(id_produto),
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor),
created_at_gostar date,
updated_at_gostar date
);

create table favorito(
id_favorito integer primary key,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
id_produto integer not null,
foreign key (id_produto) references produto(id_produto),
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor),
created_at_favorito date,
updated_at_favorito date
);

create table cartao_credito(
id_cartao_credito integer primary key,
marca_cartao_credito varchar(20) not null,
primeiro_digito_cartao_credito varchar(20) not null,
ultimo_digito_cartao_credito varchar(20) not null,
impressao_digital_cartao_credito varchar(20) not null,
id_externo_cartao_credito varchar(20) not null,
valido_cartao_credito boolean not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
created_at_cartao_credito date,
updated_at_cartao_credito date
);

create table carrinho(
id_carrinho integer primary key,
quantidade_carrinho bigint,
ativo_carrinho boolean not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
id_produto_tamanho integer not null,
foreign key (id_produto_tamanho) references produto_tamanho(id_produto_tamanho),
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor),
created_at_cartao_carrinho date,
updated_at_cartao_carrinho date
);

create table banco(
id_banco integer primary key,
cod_banco varchar(20) not null,
nome_banco varchar(20) not null,
agencia_banco varchar(20) not null,
agencia_dv_banco varchar(20) not null,
conta_banco varchar(20) not null,
tipo_banco varchar(20) not null,
documento_tipo_banco varchar(20) not null,
documento_numerico_banco varchar(20) not null,
nome_juridico_banco varchar(20) not null,
id_externo_banco varchar (20) not null,
ativo_banco boolean not null,
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor),
created_at_banco date,
updated_at_banco date
);

create table pedido(
id_pedido integer primary key,
status_vendedor_pedido varchar(20) not null,
status_usuario_pedido varchar(20) not null,
id_transacao_pedido varchar(20) not null,
cod_rastreio_pedido varchar(20) not null,
envio_pedido varchar(20) not null,
ativo_pedido boolean not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor),
created_at_pedido date,
updated_at_pedido date
);

create table item_pedido(
id_item_pedido integer primary key,
nome_item_pedido varchar(20) not null,
descricao_pedido varchar(20) not null,
preco_usuario_item_pedido varchar(20) not null,
preco_vendedor_item_pedido varchar(20) not null,
marca_item_pedido varchar(20) not null,
tamanho_item_pedido varchar(20) not null,
quantidade_item_pedido bigint not null,
id_pedido integer not null,
foreign key (id_pedido) references pedido(id_pedido),
ativo_item_pedido boolean not null,
created_at_item_pedido date,
updated_at_item_pedido date
);

create table arquivo(
id_arquivo integer primary key,
nome_arquivo varchar(20) not null,
caminho_arquivo varchar(100) not null,
verificacao_arquivo varchar(20) not null,
tipo_arquivo varchar(100) not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
genero_arquivo varchar(100) not null,
created_at_arquivo date,
updated_at_arquivo date,
id_produto integer not null,
foreign key (id_produto) references produto(id_produto),
id_vendedor integer not null,
foreign key (id_vendedor) references vendedor(id_vendedor)
);

create table relacionamento(
id_relacionamento integer primary key,
id_seguir_relacionamento integer not null,
foreign key (id_seguir_relacionamento) references usuario(id_usuario),
id_seguindo_relacionamento integer not null,
foreign key (id_seguindo_relacionamento) references usuario(id_usuario),
created_at_relacionamento date,
updated_at_relacionamento date
);

create table estado(
id_estado integer primary key,
nome_estado varchar(20) not null,
uf_estado varchar(20) not null,
ativo_estado boolean not null,
created_at_estado date,
updated_at_estado date
);

create table cidade(
id_cidade integer primary key,
nome_cidade varchar(20) not null,
ativo_cidade boolean not null,
id_estado integer not null,
foreign key (id_estado) references estado(id_estado),
created_at_cidade date,
updated_at_cidade date
);

create table endereco(
id_endereco integer primary key,
created_at_endereco date,
updated_at_endereco date,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
endereco_endereco varchar(100) not null,
cod_postal varchar(20),
referencia_endereco varchar(100),
numero_endereco varchar(100) not null,
id_cidade integer not null,
foreign key(id_cidade) references cidade(id_cidade)
);


create table migracao(
id_migracao integer primary key,
timestamp_migracao date,
nome_migracao varchar(20) not null
);

create table fichas_usuario(
id_fichas_usuario integer primary key,
ficha_fichas_usuario integer not null,
id_usuario integer not null,
foreign key (id_usuario) references usuario(id_usuario),
created_at_fichas_usuario date,
updated_at_fichas_usuario date
);

--Inserção de dados

insert into marca values
(1, 'Prada', true, '02/05/2023', '03/09/2023' ),
(2, 'DC', true, '04/05/2023', '01/09/2023' );

insert into produto values
(01, 'calça','jeans escuro',75.00, 1, 23, '02/09/2009', '08/04/2023'),
(02, 'casaco','tipo de tecido: veludo',175.00, 1, 23, '02/09/2009', '08/04/2023');

insert into categoria values
(001,'feminino',true,001,'02/04/2023', '01/08/2023'),
(002,'masculino',true,001,'03/07/2023', '06/08/2023');

insert into tamanho values
(10,'M', 'calça', true, '09/08/2019', '05/09/2022'),
(11,'P', 'casaco', true, '01/08/2019', '07/09/2022');

insert into produto_tamanho values
(1, 100, 10, 01, true, '09/08/2021', '01/09/2023'),
(2, 200, 11,02,true, '09/04/2021', '02/09/2023');

insert into usuario values
(1, 'Heloise','HeloiseSouza@gmail.com', '99465-9876','11/28/2001', '1', 'feminino', 'banana', '01/09/2023', '10/03/2023',true),
(2, 'Mateus','mateusGourlat@gmail.com', '99465-0098','08/20/2002', '2', 'masculino', 'batata', '01/01/2023', '09/04/2023',true);

insert into vendedor values
(1, 'Eriseu', '234.234.234-09', '123454', 1, 1, '09/01/2022', '09/08/2023', true),
(2, 'Samuel', '134.9874.344-08', '678905', 1, 2, '03/01/2022', '09/09/2023', true);

insert into gostar values
(1, 1, 01, 1, '02/01/2023', '01/02/2023'),
(2, 2, 02, 2, '09/09/2022', '11/10/2023');

insert into favorito values
(1, 1, 01, 1, '02/01/2023', '01/02/2023'),
(2, 2, 02, 2, '09/09/2022', '11/10/2023');


insert into cartao_credito values
(1, 'masterCart', '3', '9', '234', 1, true, 1, '02/01/2023', '01/02/2023'),
(2, 'masterCart', '9', '10', '456', 2, true, 2, '09/09/2022', '11/10/2023');

insert into carrinho values
(1, 20, true, 1, 01, 1, '09/01/2022', '11/10/2023'),
(2, 30, true, 2, 02, 2, '02/01/2023', '01/02/2023');

insert into banco values
(1, '098', 'Inter', '0001', '0002','2345677', 'corrente', 'boleto', '37489392', 'Inter','01', true, 1, '02/01/2023', '01/02/2023'),
(2, '023', 'Banco do Brasil', '0004', '0003','9383749', 'corrente', 'cartão de crédito', '039376202', 'Banco do Brasil','01', true, 2, '04/09/2023', '11/02/2023');

insert into pedido values
(1,'a caminho', 'pago', '23','1A2D3GH4K', 'sedex', true, 1, 1,'02/01/2023', '01/02/2023'),
(2,'entrege', 'avaliado', '45','1SHU58SJ', 'correio', true, 2, 2,'09/09/2022', '11/10/2023');

insert into item_pedido values
(1,'calça linho','bonito','67.45','150.89','Prada','P', 1, 1, true, '02/01/2023', '01/02/2023'),
(2,'casaco','100% algodão','120.45','200.89','Prada','M', 3, 2, true, '09/09/2022', '11/10/2023');

insert into arquivo values
(1, 'foto da calça', 'c:\jhdjedodek\slodwqpo\hdwjdwo\fotoDaCalça.pgn','verificado', 'png', 1, 'nao sei o que é professora', '02/01/2023', '01/02/2023', 01, 1),
(2, 'foto do casaco', 'c:\jhdjedodek\slodwqpo\hdwjdwo\fotoDoCasaco.pgn','verificado', 'png', 2, 'nao sei o que é professora', '09/09/2022', '11/10/2023', 02, 2);

insert into relacionamento values
(1, 1, 1, '02/01/2023', '01/02/2023'),
(2, 2, 2,'09/09/2022', '11/10/2023');

insert into estado values 
(1, 'Mato-Grosso', 'MT', true, '02/01/2023', '01/02/2023'),
(2, 'São Paulo', 'SP', true, '09/09/2022', '11/10/2023');

insert into cidade values
(1, 'Cuiabá', true, 1, '02/01/2023', '01/02/2023'),
(2, 'São Paulo', true, 2, '09/09/2022', '11/10/2023');

insert into endereco values
(1, '02/01/2023', '01/02/2023', 1, 'rua B, bairro Maria das flores', '123455', 'Próximo a escola Maria das Flores', 32, 1),
(2, '09/09/2022', '11/10/2023', 2, 'rua C, bairro Boa aventura', '435467', 'Próximo ao mercado Atacadão', 37, 2);

insert into migracao values
(1, '02/01/2023', 'Transação'),
(2,'09/09/2022', 'Pix');

insert into fichas_usuario values
(1, 1, 1, '02/01/2023', '01/02/2023'),
(2, 2, 2, '09/09/2022', '11/10/2023');


-- Seleção de tabelas

select * from marca;
select * from produto;
select * from categoria;
select * from tamanho;
select * from produto_tamanho;
select * from usuario;
select * from vendedor;
select * from gostar;
select * from favorito;
select * from cartao_credito;
select * from carrinho;
select * from banco;
select * from pedido;
select * from item_pedido;
select * from arquivo;
select * from relacionamento;
select * from estado;
select * from cidade;
select * from endereco;
select * from migracao;
select * from fichas_usuario;

--listar as tabelas
\d













