INSERT INTO `mydb`.`paciente`
(`nome`,
`email`,
`senha`,
`saldo`)
VALUES
('Matheus',
'matheus3@email.com',
123,
0),
('Nicolas',
'nicolas@email.com',
123,
0 
);

INSERT INTO `mydb`.`psicologo`
(`nome`,
`email`,
`senha`,
`saldo`,
`cnp`)
VALUES
("Cassio",
"cassio@email.com",
"123",
100,
"101"),
("Fagner",
"fagner@email.com",
"123",
100,
"102")
;

INSERT INTO `mydb`.`sessao`
(
`recorrencia`,
`dia_semana`,
`id_psicologo`,
`em_grupo`,
`duracao`,
`hora_inicio`,
`valor`)
VALUES("semanal",
2,
2,
1,
"01:00",
"13:00",
50),
("quinzenal",
1,
1,
0,
"00:45",
"14:00",
100);

INSERT INTO `mydb`.`paciente_tem_sessao`
(`id_paciente`,
`id_sessao`,
`id_psicologo`,
`pago`,
`data`)
VALUES
(1,
1,
2,
0,
"9999-12-31"
),
(2,
2,
1,
1,
"9999-10-31"
);
