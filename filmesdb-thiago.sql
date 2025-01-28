create database filmedb;
use filmedb;

create table filme(
	id int auto_increment primary key,
    nome varchar(200) not null,
    ano int not null,
    descricao text,
    url text
);
insert into filme(nome,ano ,descricao, url)
values  ('O Senhor dos Anéis: A Sociedade do Anel', 2001, 'Uma jornada para destruir o anel do poder.', "https://th.bing.com/th/id/OIP.2R8YOsJ-6iT49BULs_mf2gHaEK?w=277&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7" ),
('O Poderoso Chefão', 1972, 'A história da família Corleone no crime organizado.', 'https://th.bing.com/th/id/OIP.b-gr7I5ozlp-HDfm843NXgHaEK?w=319&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Forrest Gump', 1994, 'A vida de um homem simples que impacta a história dos EUA.', 'https://th.bing.com/th/id/OIP.SoTin_IJWjPr74_PiZq6ZwHaLH?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('A Origem', 2010, 'Ladrão de ideias invade os sonhos das pessoas.', 'https://th.bing.com/th/id/OIP.hcqewsWSiEKpkSRYZbuprQHaDx?w=342&h=178&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Matrix', 1999, 'Hacker descobre que a realidade é uma ilusão criada por máquinas.', 'https://th.bing.com/th/id/OIP.OTQ7fh1eWJXpPehda8GdHQHaFj?w=195&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Jurassic Park', 1993, 'Cientistas tentam controlar dinossauros clonados.', 'https://th.bing.com/th/id/OIP.hMXm2IvvaVOR_ykyYS8uewHaEK?w=312&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('O Rei Leão', 1994, 'Simba luta para se tornar o rei da savana','https://th.bing.com/th/id/OIP.aTce4RoH9Uk9kKbpg3dgDQHaEK?w=253&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Gladiador', 2000, 'General romano busca vingança nas arenas de gladiadores.', 'https://th.bing.com/th/id/OIP.JsyDeGEH6MeI_O62CMqCgAHaE8?w=263&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Harry Potter e a Pedra Filosofal', 2001, 'Jovem bruxo inicia sua jornada na escola de magia.', 'https://th.bing.com/th/id/OIP.M0Dii7RS3iZNsKUHAvQ7iAAAAA?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Titanic', 1997, 'Romance a bordo do navio que afunda.', 'https://th.bing.com/th/id/OIP.s6qnJ-HzQvjThekdVSj2vgHaEo?w=271&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Pulp Fiction', 1994, 'Histórias entrelaçadas sobre crime e redenção.', 'https://th.bing.com/th/id/OIP.sTV_Ouz6SPkQW4MbAY2n_QHaKn?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Clube da Luta', 1999, 'Homens fundam um clube secreto para desafiar normas sociais.', 'https://th.bing.com/th/id/OIP.DeD2FgfST3WpBHPdhA_ItQHaFP?w=229&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Cidadão Kane', 1941, 'A vida e o legado de um magnata da mídia.', 'https://th.bing.com/th/id/OIP.dHlAlIzudCCojlap6x0NTAHaJK?w=138&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('A Bela e a Fera', 1991, 'Jovem se apaixona por uma fera encantada.', 'https://th.bing.com/th/id/OIP.mLzC4srfxC5G3Cs7Hoo6FwHaFb?w=235&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('Vingadores: Ultimato', 2019, 'Heróis enfrentam Thanos para salvar o universo.', 'https://th.bing.com/th/id/OIP.VrnNrkPgD-s4LXIlMDKKigHaFp?w=208&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('O Grande Lebowski', 1998, 'Homem preguiçoso se envolve em uma trama de sequestro.', 'https://th.bing.com/th/id/OIP.GQCCZKCm5Bem2UEvUTfu-AHaKk?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('A Viagem de Chihiro', 2001, 'Menina perdida em um mundo de espíritos e criaturas mágicas.', 'https://th.bing.com/th/id/OIP.geq1Ba8XiJ1oRqwqSiHZGgHaFj?w=241&h=181&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('O Exorcista', 1973, 'Menina possuída luta contra um demônio.', 'https://th.bing.com/th/id/OIP.AwOf0xeqlSIB5OST_TD3KAHaLG?w=115&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
('O Silêncio dos Inocentes', 1991, 'Agente do FBI procura ajuda de um serial killer.', 'https://th.bing.com/th/id/OIP.12Pv7P_9pr3oEmDI7sBy_AHaJ4?w=135&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7');


drop table filme;

select * from filme;

drop table filme;