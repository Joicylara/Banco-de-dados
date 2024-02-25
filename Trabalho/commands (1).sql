
create table caminhao(
  placa varchar(20) primary key,
  capacidade varchar(20) not null
);

create viagem(
  numero_viagem integer primary key,
  data_viagem date not null,
  foreign key caminhao_placa varchar(20)
  );
  
create index viagem_caminhao_placa on viagem (caminhao_placa);
 
create table destino(
  numero_destino integer primary key,
  endereco varchar(20) not null
 );
 
 
create table encomenda(
  numero_encomenda integer primary key,
  foreign key destino_numero_destino integer,
  foreign key viagem_numero_viagem integer,
  data_2 date not null,
  peso varchar(20) not null
);

create index encomenda_numero_viagem on encomenda (viagem_numero_viagem);

create index encomenda_numero_destino on encomenda (destino_numero_destino);







