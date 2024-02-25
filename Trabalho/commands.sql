
-- create
CREATE TABLE Aluno (
  Id integer PRIMARY KEY,
  nome varchar(20) NOT NULL
);

CREATE TABLE Disciplina(
  Id_d integer PRIMARY KEY,
  disciplina text NOT NULL
);

CREATE TABLE aluno_disciplina(
  aluno text NOT NULL,
  disciplina text NOT NULL,
  primary key(aluno, disciplina),
  foreign key(aluno) referencesAluno (Id),
  foreign key (disciplina) references Disciplina (Id),
)

-- insert
INSERT INTO aluno VALUES (1, 'Clark');
INSERT INTO aluno VALUES (2, 'Dave');
INSERT INTO aluno VALUES (3, 'Ava');

-- fetch 
SELECT * FROM aluno;



