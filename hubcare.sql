-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2024 às 23:24
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hubcare`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessos`
--

CREATE TABLE `acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `chave` varchar(50) NOT NULL,
  `grupo` int(11) NOT NULL,
  `pagina` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `acessos`
--

INSERT INTO `acessos` (`id`, `nome`, `chave`, `grupo`, `pagina`) VALUES
(1, 'Home', 'home', 0, NULL),
(2, 'Configurações', 'configuracoes', 0, 'Não'),
(3, 'Usuários', 'usuarios', 1, NULL),
(4, 'Acessos', 'acessos', 2, NULL),
(5, 'Grupos Acesso', 'grupo_acessos', 2, NULL),
(8, 'Cargos', 'cargos', 2, NULL),
(9, 'Horários / Dias', 'horarios', 0, NULL),
(10, 'Procedimentos', 'procedimentos', 2, NULL),
(11, 'Convênios', 'convenios', 2, NULL),
(12, 'Pacientes', 'pacientes', 1, 'Sim'),
(13, 'Funcionários', 'funcionarios', 1, NULL),
(14, 'Formas de PGTO', 'formas_pgto', 2, NULL),
(15, 'Frequências', 'frequencias', 2, NULL),
(16, 'Recebimentos', 'receber', 5, 'Sim'),
(17, 'Despesas', 'pagar', 5, 'Sim'),
(18, 'Comissões', 'comissoes', 5, 'Sim'),
(19, 'Demonstrativo de Lucro', 'rel_lucro', 5, 'Não'),
(20, 'Relatórios Financeiros', 'rel_financeiro', 5, 'Não'),
(21, 'Minhas Comissões', 'minhas_comissoes', 0, 'Sim'),
(22, 'Recebimento Convênio', 'recebimento_convenio', 5, 'Não'),
(23, 'Consultas', 'consultas', 0, 'Sim'),
(24, 'Agendamentos', 'agendamentos', 6, 'Sim'),
(25, 'Relatório de Agendamentos', 'rel_agendamentos', 6, 'Não'),
(26, 'Grupos Anamnese', 'grupos_ana', 2, 'Sim'),
(27, 'Itens Anamnese', 'itens_ana', 2, 'Sim'),
(28, 'Calendário Agenda', 'calendario', 0, 'Sim'),
(30, 'Receitas / Remédios', 'receitas', 2, 'Sim'),
(31, 'Relatório de Procedimentos', 'rel_procedimentos', 6, 'Não'),
(32, 'Caixas', 'caixas', 0, 'Sim'),
(33, 'Tratamentos', 'tratamentos', 0, 'Sim');

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `obs` varchar(100) DEFAULT NULL,
  `data_lanc` date NOT NULL,
  `usuario` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `servico` int(11) NOT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `pago` varchar(5) DEFAULT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `valor` decimal(8,2) DEFAULT NULL,
  `convenio` int(11) DEFAULT NULL,
  `retorno` varchar(5) DEFAULT NULL,
  `status_cor` varchar(50) DEFAULT NULL,
  `numero_convenio` varchar(100) DEFAULT NULL,
  `id_tratamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `funcionario`, `paciente`, `data`, `hora`, `obs`, `data_lanc`, `usuario`, `status`, `servico`, `hash`, `pago`, `tipo_pagamento`, `valor`, `convenio`, `retorno`, `status_cor`, `numero_convenio`, `id_tratamento`) VALUES
(1, 24, 4, '2024-06-15', '10:00:00', '', '2024-06-04', 34, 'Agendado', 31, '', 'Não', NULL, NULL, 0, 'Não', NULL, NULL, NULL),
(2, 24, 6, '2024-06-19', '08:00:00', '', '2024-06-18', 34, 'Confirmado', 31, '', 'Não', NULL, NULL, 0, 'Não', 'Em atendimento', NULL, NULL),
(3, 34, 3, '2024-06-03', '09:00:00', '', '2024-06-28', 34, 'Agendado', 1, '', 'Não', NULL, NULL, 0, 'Não', NULL, NULL, NULL),
(4, 34, 1, '2024-07-23', '16:00:00', '', '2024-07-23', 34, 'Agendado', 1, '', 'Não', NULL, NULL, 0, 'Não', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `anamnese`
--

CREATE TABLE `anamnese` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `anamnese`
--

INSERT INTO `anamnese` (`id`, `paciente`, `item`, `descricao`, `grupo`) VALUES
(24, 1, 1, '3 vezes por semana', 1),
(25, 1, 2, '2 maços por dia', 1),
(26, 1, 3, '2 vezes por semana', 1),
(27, 1, 4, 'Tenis e Futebol regularmente', 1),
(28, 1, 5, 'Dipirona e Paracetamol', 2),
(29, 1, 6, 'Cisto na mão', 2),
(31, 1, 12, 'aaaaa', 3),
(32, 1, 8, 'A mãe teve cancer de mama', 4),
(33, 1, 9, 'Avós', 4),
(36, 3, 3, '2 Vezes ao dia', 1),
(38, 3, 13, NULL, 3),
(40, 3, 14, NULL, 3),
(43, 1, 10, '', 4),
(45, 3, 2, '2 Cigarros por dia', 1),
(46, 3, 1, '3 Vezes por semana', 1),
(47, 1, 13, NULL, 3),
(49, 1, 14, '', 3),
(51, 3, 17, 'Dorme 4 horas por dia', 1),
(52, 3, 6, 'Retirada de Cisto', 2),
(53, 3, 5, 'Paracetamol', 2),
(54, 6, 4, 'sss', 1),
(55, 6, 2, 'sss', 1),
(56, 3, 12, 'fdfdffdsfsd', 3),
(57, 7, 9, 'Sim', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquivos`
--

CREATE TABLE `arquivos` (
  `id` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `arquivo` varchar(100) NOT NULL,
  `data_cad` date NOT NULL,
  `registro` varchar(50) NOT NULL,
  `id_reg` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `arquivos`
--

INSERT INTO `arquivos` (`id`, `nome`, `descricao`, `arquivo`, `data_cad`, `registro`, `id_reg`, `usuario`) VALUES
(2, 'fddfsfds', NULL, '15-05-2023-13-44-46-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Paciente', 1, 1),
(3, 'teste', NULL, '15-05-2023-13-45-20-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Conta à Receber', 15, 1),
(4, 'teste', NULL, '15-05-2023-13-45-20-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Paciente', 1, 1),
(5, 'afsafdas', NULL, '15-05-2023-13-50-41-09-11-2021-12-04-29-pdfteste.zip', '2023-05-15', 'Paciente', 3, 1),
(6, 'teste', NULL, '15-05-2023-13-52-47-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Conta à Receber', 9, 1),
(7, 'teste', NULL, '15-05-2023-13-52-47-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Convênio', 1, 1),
(8, 'dasfafsaf', NULL, '15-05-2023-13-53-05-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Convênio', 1, 1),
(9, 'contrato', NULL, '15-05-2023-13-53-15-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Convênio', 4, 1),
(10, 'aa', NULL, '15-05-2023-15-11-46-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Conta à Pagar', 2, 1),
(11, 'aa', NULL, '15-05-2023-15-11-46-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Funcionário', 15, 1),
(12, 'bb', NULL, '15-05-2023-15-11-50-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Conta à Pagar', 2, 1),
(13, 'bb', NULL, '15-05-2023-15-11-50-09-11-2021-09-21-26-conta3.jpg', '2023-05-15', 'Funcionário', 15, 1),
(14, 'gas', NULL, '15-05-2023-15-11-58-18-10-2021-14-50-06-caixa-som.rar', '2023-05-15', 'Conta à Pagar', 1, 1),
(15, 'nf', NULL, '15-05-2023-20-51-30-09-11-2021-10-17-10-pdfteste.pdf', '2023-05-15', 'Conta à Pagar', 14, 1),
(16, 'fsfd', NULL, '15-05-2023-20-51-35-09-11-2021-12-04-29-pdfteste.zip', '2023-05-15', 'Conta à Pagar', 14, 1),
(17, '4', NULL, '24-10-2023-19-14-51-c9cf2d5d620c28b0e8624409d2013fde081a678e_full.jpg', '2023-10-24', 'Conta à Receber', 34, 1),
(18, '4', NULL, '24-10-2023-19-14-51-c9cf2d5d620c28b0e8624409d2013fde081a678e_full.jpg', '2023-10-24', 'Paciente', 4, 1),
(20, 'teste', NULL, '28-05-2024-15-23-15-eu.jpeg', '2024-05-28', 'Paciente', 1, 1),
(22, 'aaa', NULL, '28-05-2024-15-24-51-eu.jpeg', '2024-05-28', 'Paciente', 1, 1),
(24, 'aaa', NULL, '28-05-2024-15-31-03-eu.jpeg', '2024-05-28', 'Paciente', 1, 1),
(26, 'fdfds', NULL, '28-05-2024-15-33-00-eu.jpeg', '2024-05-28', 'Paciente', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixas`
--

CREATE TABLE `caixas` (
  `id` int(11) NOT NULL,
  `operador` int(11) NOT NULL,
  `data_abertura` date NOT NULL,
  `data_fechamento` date DEFAULT NULL,
  `valor_abertura` decimal(8,2) NOT NULL,
  `valor_fechamento` decimal(8,2) DEFAULT NULL,
  `quebra` decimal(8,2) DEFAULT NULL,
  `usuario_abertura` int(11) NOT NULL,
  `usuario_fechamento` int(11) DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `sangrias` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`) VALUES
(1, 'Administrador'),
(4, 'Cliníco Geral'),
(5, 'Recepcionista'),
(6, 'Faxineira'),
(11, 'Enfermeira'),
(13, 'FONOALDIOLOGA'),
(14, 'CARDIOLOGISTA'),
(15, 'ORTOPEDISTA '),
(16, 'NEUROLOGISTA'),
(17, 'OTORRINO'),
(18, 'PEDIATRA'),
(19, 'PSIQUIATRA'),
(20, 'PSICOLOGO '),
(21, 'DERMATOLOGISTA'),
(22, 'UROLOGISTA'),
(23, 'GINECOLOGISTA'),
(26, 'TECNICA EM LABORATORIO'),
(27, 'ULTRASSOM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone_fixo` varchar(20) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `logo_rel` varchar(100) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `ativo` varchar(5) DEFAULT NULL,
  `comissao` int(11) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `instancia` varchar(50) DEFAULT NULL,
  `horas_confirmacao` int(11) DEFAULT NULL,
  `marca_dagua` varchar(5) DEFAULT NULL,
  `paciente_receita` varchar(5) DEFAULT NULL,
  `ocultar_acessos` varchar(5) DEFAULT NULL,
  `desativar_marketing` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`nome`, `email`, `telefone`, `endereco`, `telefone_fixo`, `logo`, `icone`, `logo_rel`, `id`, `ativo`, `comissao`, `token`, `instancia`, `horas_confirmacao`, `marca_dagua`, `paciente_receita`, `ocultar_acessos`, `desativar_marketing`) VALUES
('Gustavo Calixto', 'gustavocalixto2005@gmail.com', '(98) 98554-454', 'Rua trinta e um, casa 28, São Luís', '(98) 9855-4454', 'logo.png', 'icone.png', 'logo.jpg', 1, 'Sim', 40, '', '', 24, 'Sim', 'Sim', 'Não', 'Não');

-- --------------------------------------------------------

--
-- Estrutura para tabela `convenios`
--

CREATE TABLE `convenios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `comissao` int(11) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `convenios`
--

INSERT INTO `convenios` (`id`, `nome`, `comissao`, `telefone`) VALUES
(9, 'FUNERARIA AFAGU', 0, '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias`
--

CREATE TABLE `dias` (
  `id` int(11) NOT NULL,
  `dia` varchar(25) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `inicio` time NOT NULL,
  `final` time NOT NULL,
  `inicio_almoco` time DEFAULT NULL,
  `final_almoco` time DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `dias`
--

INSERT INTO `dias` (`id`, `dia`, `funcionario`, `inicio`, `final`, `inicio_almoco`, `final_almoco`, `data`) VALUES
(2, 'Segunda-Feira', 1, '08:00:00', '21:00:00', '13:00:00', '14:00:00', NULL),
(3, 'Terça-Feira', 1, '00:00:00', '23:00:00', '13:00:00', '15:00:00', NULL),
(4, 'Quarta-Feira', 1, '08:00:00', '12:00:00', '00:00:00', '00:00:00', NULL),
(5, 'Quinta-Feira', 1, '08:00:00', '19:00:00', '13:00:00', '15:00:00', NULL),
(6, 'Sexta-Feira', 1, '08:00:00', '19:00:00', '13:00:00', '14:00:00', NULL),
(7, 'Sábado', 1, '08:00:00', '12:00:00', '00:00:00', '00:00:00', NULL),
(8, 'Segunda-Feira', 14, '08:00:00', '16:00:00', '12:00:00', '13:00:00', NULL),
(9, 'Terça-Feira', 14, '08:00:00', '16:00:00', '12:00:00', '13:00:00', NULL),
(10, 'Quarta-Feira', 14, '08:00:00', '20:00:00', '12:00:00', '13:00:00', NULL),
(11, 'Quinta-Feira', 14, '08:00:00', '20:00:00', '12:00:00', '13:00:00', NULL),
(12, 'Sexta-Feira', 14, '08:00:00', '20:00:00', '12:00:00', '13:00:00', NULL),
(14, 'Segunda-Feira', 13, '08:00:00', '18:00:00', '12:00:00', '13:00:00', NULL),
(15, 'Terça-Feira', 13, '08:00:00', '18:00:00', '12:00:00', '13:00:00', NULL),
(16, 'Quarta-Feira', 13, '08:00:00', '18:00:00', '12:00:00', '13:00:00', NULL),
(17, 'Quinta-Feira', 13, '08:00:00', '18:00:00', '12:00:00', '13:00:00', NULL),
(18, 'Sexta-Feira', 13, '08:00:00', '18:00:00', '12:00:00', '13:00:00', NULL),
(19, 'Segunda-Feira', 15, '08:00:00', '12:00:00', '00:00:00', '00:00:00', NULL),
(20, 'Terça-Feira', 15, '08:00:00', '12:00:00', '16:00:00', '20:00:00', NULL),
(21, 'Segunda-Feira', 18, '09:00:00', '20:00:00', '14:00:00', '15:00:00', NULL),
(22, 'Terça-Feira', 18, '09:00:00', '20:00:00', '14:00:00', '15:00:00', NULL),
(23, 'Quarta-Feira', 18, '09:00:00', '21:00:00', '14:00:00', '17:00:00', NULL),
(24, 'Quinta-Feira', 18, '09:00:00', '21:00:00', '14:00:00', '17:00:00', NULL),
(25, 'Terça-Feira', 16, '08:00:00', '21:00:00', '11:00:00', '12:00:00', NULL),
(26, 'Quarta-Feira', 16, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(27, 'Quinta-Feira', 1, '21:59:00', '19:03:00', '21:59:00', '23:03:00', NULL),
(29, 'Quarta-Feira', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(31, 'Segunda-Feira', 33, '14:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-10-30'),
(33, 'Segunda-Feira', 29, '14:00:00', '18:00:00', '00:00:00', '00:00:00', '2023-10-30'),
(34, 'Segunda-Feira', 32, '09:00:00', '12:00:00', '00:00:00', '00:00:00', '2023-11-30'),
(35, 'Segunda-Feira', 31, '09:00:00', '12:00:00', '00:00:00', '00:00:00', '2023-10-30'),
(36, 'Sexta-Feira', 28, '08:00:00', '17:07:00', '12:00:00', '12:30:00', '2023-11-17'),
(37, 'Sexta-Feira', 28, '08:00:00', '17:07:00', '12:00:00', '12:30:00', '2023-11-17'),
(38, 'Sexta-Feira', 28, '08:00:00', '17:07:00', '12:00:00', '12:30:00', '2023-11-17'),
(39, 'Quinta-Feira', 33, '14:00:00', '18:00:00', '00:00:00', '00:00:00', '2023-11-16'),
(41, 'Quarta-Feira', 29, '10:00:00', '17:00:00', '14:00:00', '14:20:00', '0003-11-08'),
(42, 'Quinta-Feira', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(43, 'Segunda-Feira', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(44, 'Terça-Feira', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(45, 'Sábado', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(46, 'Domingo', 24, '08:00:00', '20:00:00', '00:00:00', '00:00:00', '2023-11-01'),
(47, 'Sexta-Feira', 24, '08:00:00', '23:00:00', '00:00:00', '00:00:00', NULL),
(48, 'Segunda-Feira', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(49, 'Terça-Feira', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(50, 'Quarta-Feira', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(51, 'Quinta-Feira', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(52, 'Sexta-Feira', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(53, 'Sábado', 34, '08:00:00', '22:00:00', '00:00:00', '00:00:00', NULL),
(54, '', 24, '08:00:00', '12:00:00', '00:00:00', '00:00:00', '2024-06-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exames`
--

CREATE TABLE `exames` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `medico` int(11) NOT NULL,
  `exame` varchar(100) NOT NULL,
  `data` date NOT NULL,
  `clinica` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `formas_pgto`
--

CREATE TABLE `formas_pgto` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `taxa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `formas_pgto`
--

INSERT INTO `formas_pgto` (`id`, `nome`, `taxa`) VALUES
(1, 'Pix', 0),
(2, 'Cartão de Crédito', 5),
(3, 'Cartão de Débito', 3),
(4, 'Dinheiro', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `frequencias`
--

CREATE TABLE `frequencias` (
  `id` int(11) NOT NULL,
  `frequencia` varchar(25) NOT NULL,
  `dias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `frequencias`
--

INSERT INTO `frequencias` (`id`, `frequencia`, `dias`) VALUES
(1, 'Diária', 1),
(2, 'Semanal', 7),
(3, 'Mensal', 30),
(4, 'Trimestral', 90),
(5, 'Semestral', 180),
(6, 'Anual', 356);

-- --------------------------------------------------------

--
-- Estrutura para tabela `func_proc`
--

CREATE TABLE `func_proc` (
  `id` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `procedimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `func_proc`
--

INSERT INTO `func_proc` (`id`, `funcionario`, `procedimento`) VALUES
(2, 14, 1),
(6, 14, 7),
(7, 13, 5),
(8, 13, 2),
(9, 1, 2),
(10, 1, 3),
(11, 15, 2),
(12, 15, 3),
(13, 18, 2),
(14, 18, 3),
(15, 15, 4),
(16, 18, 8),
(17, 16, 1),
(18, 16, 7),
(19, 18, 5),
(20, 18, 7),
(21, 18, 1),
(22, 24, 31),
(23, 24, 11),
(24, 24, 12),
(25, 24, 13),
(26, 24, 14),
(27, 24, 18),
(28, 24, 19),
(29, 24, 20),
(30, 24, 21),
(31, 24, 22),
(32, 24, 23),
(33, 24, 24),
(34, 24, 25),
(35, 24, 26),
(36, 24, 10),
(38, 33, 27),
(39, 33, 29),
(40, 33, 28),
(41, 33, 55),
(42, 29, 56),
(43, 29, 57),
(44, 32, 30),
(45, 32, 57),
(46, 31, 57),
(47, 31, 58),
(48, 30, 59),
(49, 30, 57),
(50, 28, 57),
(51, 28, 39),
(53, 24, 57),
(54, 28, 40),
(55, 33, 61),
(56, 24, 44),
(57, 24, 62),
(58, 24, 1),
(59, 34, 1),
(60, 34, 10),
(61, 34, 11),
(62, 34, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_acessos`
--

CREATE TABLE `grupo_acessos` (
  `id` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `grupo_acessos`
--

INSERT INTO `grupo_acessos` (`id`, `nome`) VALUES
(1, 'Pessoas'),
(2, 'Cadastros'),
(5, 'Financeiro'),
(6, 'Agendamentos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_ana`
--

CREATE TABLE `grupo_ana` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `grupo_ana`
--

INSERT INTO `grupo_ana` (`id`, `nome`, `descricao`) VALUES
(1, 'Hábitos Diários', ''),
(2, 'Condições do Paciente', ''),
(3, 'Doenças Cardiovasculares', ''),
(4, 'Histórico Familiar', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_paciente`
--

CREATE TABLE `historico_paciente` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `descricao` varchar(2000) NOT NULL,
  `data` date NOT NULL,
  `consulta` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `nome_funcionario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `historico_paciente`
--

INSERT INTO `historico_paciente` (`id`, `paciente`, `descricao`, `data`, `consulta`, `funcionario`, `nome_funcionario`) VALUES
(4, 1, 'Paciente queixou de dores de cabeça, devido as constantes dores foi encaminhado para uma biopsia.', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(5, 1, 'Foi feito uma tumografia e não foi identificado nada, as dores ainda permanecem.', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(6, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok.', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(7, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok.', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(8, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok.', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(11, 1, 'Paciente teve um AVC e vem se recuperando bem, alguns movimentos ainda estão comprometidos.', '2023-05-23', 13, 18, 'Silvano Souza'),
(12, 1, 'fdsfdas fadfa fdfa fdas fdasfsda fdsa fas fasf dasf adsf ', '2023-05-23', 35, 1, 'Hugo Vasconcelos'),
(13, 1, 'Foi solicitado exame de sangue para verificar ....', '2023-05-30', 52, 1, 'Hugo Vasconcelos'),
(14, 1, 'gdgdg', '2023-11-28', 0, 24, 'DR TESTE'),
(15, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(16, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(17, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(18, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(19, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(20, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(21, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(22, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(23, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(24, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(25, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos'),
(26, 1, 'Paciente apresenta um bom estado clinico, fez checkup recentemente e tudo está ok', '2024-05-25', 0, 21, 'Hugo Vasconcelos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `horarios_agd`
--

CREATE TABLE `horarios_agd` (
  `id` int(11) NOT NULL,
  `agendamento` int(11) NOT NULL,
  `horario` time NOT NULL,
  `data` date NOT NULL,
  `funcionario` int(11) NOT NULL,
  `id_tratamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_ana`
--

CREATE TABLE `itens_ana` (
  `id` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `itens_ana`
--

INSERT INTO `itens_ana` (`id`, `grupo`, `nome`, `descricao`) VALUES
(1, 1, 'Ingere bebida alcoolica?', ''),
(2, 1, 'Tabagismo?', ''),
(3, 1, 'Funcionamento Intestinal Regular?', ''),
(4, 1, 'Pratica atividade física?', ''),
(5, 2, 'Alergia a Medicamentos?', ''),
(6, 2, 'Fez cirurgia?', ''),
(7, 2, 'Gestações?', ''),
(8, 4, 'Câncer?', ''),
(9, 4, 'Diabetes?', ''),
(10, 4, 'Pressão Alta?', ''),
(11, 4, 'Outras Doenças?', ''),
(12, 3, 'Hipertensão arterial', ''),
(13, 3, 'Doença arterial periférica', ''),
(14, 3, 'Cardiopatia congênita', ''),
(17, 1, 'Problemas com Sono?', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marketing`
--

CREATE TABLE `marketing` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `data_envio` date DEFAULT NULL,
  `envios` int(11) DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `mensagem` varchar(500) DEFAULT NULL,
  `item1` varchar(100) DEFAULT NULL,
  `item2` varchar(100) DEFAULT NULL,
  `item3` varchar(100) DEFAULT NULL,
  `item4` varchar(100) DEFAULT NULL,
  `item5` varchar(100) DEFAULT NULL,
  `item6` varchar(100) DEFAULT NULL,
  `item7` varchar(100) DEFAULT NULL,
  `item8` varchar(100) DEFAULT NULL,
  `item9` varchar(100) DEFAULT NULL,
  `item10` varchar(100) DEFAULT NULL,
  `item11` varchar(100) DEFAULT NULL,
  `item12` varchar(100) DEFAULT NULL,
  `item13` varchar(100) DEFAULT NULL,
  `item14` varchar(100) DEFAULT NULL,
  `item15` varchar(100) DEFAULT NULL,
  `item16` varchar(100) DEFAULT NULL,
  `item17` varchar(100) DEFAULT NULL,
  `item18` varchar(100) DEFAULT NULL,
  `item19` varchar(100) DEFAULT NULL,
  `item20` varchar(100) DEFAULT NULL,
  `conclusao` varchar(500) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `forma_envio` varchar(50) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `hash2` varchar(100) DEFAULT NULL,
  `hash3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `data_nasc` date NOT NULL,
  `tipo_sanguineo` varchar(5) DEFAULT NULL,
  `data_cad` date NOT NULL,
  `nome_responsavel` varchar(50) DEFAULT NULL,
  `cpf_responsavel` varchar(20) DEFAULT NULL,
  `convenio` int(11) NOT NULL,
  `obs` varchar(2000) DEFAULT NULL,
  `sexo` varchar(5) DEFAULT NULL,
  `profissao` varchar(60) DEFAULT NULL,
  `estado_civil` varchar(25) DEFAULT NULL,
  `telefone2` varchar(20) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `telefone`, `cpf`, `endereco`, `data_nasc`, `tipo_sanguineo`, `data_cad`, `nome_responsavel`, `cpf_responsavel`, `convenio`, `obs`, `sexo`, `profissao`, `estado_civil`, `telefone2`, `senha`) VALUES
(7, 'Chico', '(11) 11111-1111', '111.111.111-11', 'Rua 31', '1111-11-11', 'A', '2024-12-05', '', '', 9, '', 'M', '', 'Solteiro', '', '$2y$10$NQLglPf0K4.7Pk7LW8J.l.1Mwf/j41yNHbKZigsMGa.SAbkYVmz86');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagar`
--

CREATE TABLE `pagar` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `funcionario` int(11) DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_lanc` date DEFAULT NULL,
  `data_venc` date DEFAULT NULL,
  `data_pgto` date DEFAULT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_pgto` int(11) DEFAULT NULL,
  `frequencia` int(11) NOT NULL,
  `saida` varchar(50) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  `pago` varchar(5) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `referencia` varchar(40) DEFAULT NULL,
  `id_ref` int(11) DEFAULT NULL,
  `desconto` decimal(8,2) DEFAULT NULL,
  `troco` decimal(8,2) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cancelada` varchar(5) DEFAULT NULL,
  `caixa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `procedimentos`
--

CREATE TABLE `procedimentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `tempo` int(11) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `exame` varchar(5) DEFAULT NULL,
  `convenio` varchar(5) DEFAULT NULL,
  `preparo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `procedimentos`
--

INSERT INTO `procedimentos` (`id`, `nome`, `valor`, `tempo`, `ativo`, `exame`, `convenio`, `preparo`) VALUES
(27, 'USG MAMA ( DRA PATRICIA )', 130.00, 30, 'Sim', 'Sim', 'Sim', NULL),
(28, 'USG TIREOIDE (DRA PATRICIA )', 130.00, 30, 'Sim', 'Sim', 'Sim', NULL),
(29, 'USG TRANSVAGINAL (DRA PATRICIA)', 130.00, 30, 'Sim', 'Sim', 'Sim', NULL),
(30, 'ORTOPEDISTA ', 200.00, 10, 'Sim', 'Não', 'Sim', NULL),
(31, 'CARDIOLOGISTA', 250.00, 15, 'Sim', 'Não', 'Sim', 'Ficar 3 Horas em Jejum'),
(32, 'NEUROLOGISTA', 400.00, 10, 'Sim', 'Não', 'Sim', NULL),
(33, 'DERMATOLOGISTA', 250.00, 10, 'Sim', 'Não', 'Sim', NULL),
(34, 'PSICOLOGO CONSULTA', 130.00, 40, 'Sim', 'Não', 'Sim', NULL),
(35, 'PSICOLOGO SESSÃO', 80.00, 40, 'Sim', 'Não', 'Sim', NULL),
(36, 'FONO ( CONSULTA )', 130.00, 40, 'Sim', 'Não', 'Sim', NULL),
(37, 'FONO (SESSÃO', 80.00, 40, 'Sim', 'Não', 'Sim', NULL),
(38, 'PEDIATRA', 250.00, 15, 'Sim', 'Não', 'Sim', NULL),
(39, 'OTORRINO', 250.00, 15, 'Sim', 'Não', 'Sim', NULL),
(40, 'VIDEOLARINGOSCOPIA', 250.00, 15, 'Sim', 'Sim', 'Sim', NULL),
(41, 'GASTRO', 250.00, 20, 'Sim', 'Não', 'Sim', NULL),
(42, 'ENDOSCOPIA ', 300.00, 20, 'Sim', 'Sim', 'Sim', NULL),
(43, 'ENDOSCOPIA + CONSULTA ', 450.00, 30, 'Sim', 'Sim', 'Sim', NULL),
(44, 'ECOCARDIOGRAMA ', 230.00, 15, 'Sim', 'Sim', 'Sim', NULL),
(45, 'NUTRICIONISTA ', 150.00, 40, 'Sim', 'Não', 'Sim', NULL),
(46, 'PSIQUIATRA', 300.00, 20, 'Sim', 'Não', 'Sim', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `receber`
--

CREATE TABLE `receber` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_lanc` date NOT NULL,
  `data_venc` date NOT NULL,
  `data_pgto` date DEFAULT NULL,
  `usuario_lanc` int(11) NOT NULL,
  `usuario_pgto` int(11) DEFAULT NULL,
  `frequencia` int(11) NOT NULL,
  `saida` varchar(50) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  `pago` varchar(5) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `referencia` varchar(40) DEFAULT NULL,
  `id_ref` int(11) DEFAULT NULL,
  `desconto` decimal(8,2) DEFAULT NULL,
  `troco` decimal(8,2) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `cancelada` varchar(5) DEFAULT NULL,
  `convenio` int(11) DEFAULT NULL,
  `caixa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `receber`
--

INSERT INTO `receber` (`id`, `descricao`, `cliente`, `valor`, `data_lanc`, `data_venc`, `data_pgto`, `usuario_lanc`, `usuario_pgto`, `frequencia`, `saida`, `arquivo`, `pago`, `obs`, `referencia`, `id_ref`, `desconto`, `troco`, `hora`, `cancelada`, `convenio`, `caixa`) VALUES
(1, 'Teste', 0, 50.00, '2024-07-19', '2024-07-19', '0000-00-00', 34, 0, 0, 'Pix', 'sem-foto.png', 'Não', '', 'Conta', NULL, NULL, NULL, '13:01:41', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `receita`
--

CREATE TABLE `receita` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `medico` int(11) NOT NULL,
  `remedio` varchar(255) DEFAULT NULL,
  `quantidade` varchar(255) DEFAULT NULL,
  `uso` varchar(500) DEFAULT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `receita`
--

INSERT INTO `receita` (`id`, `paciente`, `medico`, `remedio`, `quantidade`, `uso`, `data`) VALUES
(37, 3, 1, 'aaaaa', '5', 'cdasfafddaf', '2023-08-21'),
(38, 3, 1, 'afdsfsafa', '5', 'fdfdsfsfds', '2023-08-21'),
(42, 1, 24, 'Ibuprofeno', 'Caixa 12 comprimidos', 'Tomar 1 comprimido a cada 8 horas', '2024-03-11'),
(43, 1, 24, 'Paracetamol', 'Cartela 12 comprimidos', 'Tomar de 12 em 12 horas', '2024-03-11'),
(44, 1, 24, 'Dipirona Gotas', '2 Frascos', 'Tomar de 8 em 8 horas 30 gotas', '2024-03-11'),
(45, 1, 24, 'Anti alergico', '2 Frasco', 'Tomar de 8 em 8 horas', '2024-03-11'),
(46, 4, 24, 'xxxx', 'xxx', 'xxx', '2024-03-11');

-- --------------------------------------------------------

--
-- Estrutura para tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(11) NOT NULL,
  `remedio` varchar(100) NOT NULL,
  `quantidade` varchar(100) DEFAULT NULL,
  `uso` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `receitas`
--

INSERT INTO `receitas` (`id`, `remedio`, `quantidade`, `uso`) VALUES
(2, 'Paracetamol', 'Cartela 12 comprimidos', 'Tomar de 12 em 12 horas'),
(6, 'Anti alergico', '1 Frasco', 'Tomar de 6 em 6 horas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sangrias`
--

CREATE TABLE `sangrias` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `caixa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tratamentos`
--

CREATE TABLE `tratamentos` (
  `id` int(11) NOT NULL,
  `paciente` int(11) NOT NULL,
  `procedimento` int(11) NOT NULL,
  `profissional` int(11) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `frequencia` int(11) NOT NULL,
  `hora1` time DEFAULT NULL,
  `hora2` time DEFAULT NULL,
  `hora3` time DEFAULT NULL,
  `hora4` time DEFAULT NULL,
  `hora5` time DEFAULT NULL,
  `hora6` time DEFAULT NULL,
  `quitado` varchar(5) DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `senha_crip` varchar(130) NOT NULL,
  `nivel` varchar(25) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `data` date NOT NULL,
  `atendimento` varchar(5) DEFAULT NULL,
  `pagamento` varchar(50) DEFAULT NULL,
  `comissao` int(11) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `intervalo` int(11) NOT NULL,
  `crm` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `senha_crip`, `nivel`, `ativo`, `telefone`, `endereco`, `foto`, `data`, `atendimento`, `pagamento`, `comissao`, `cpf`, `intervalo`, `crm`) VALUES
(34, 'Gustavo Calixto', 'gustavocalixto2005@gmail.com', '', '$2y$10$JQLQCMS2VCHHNcFgLptYSubeKW.mmovTqy3xJ3LMY1CNCjbuppPoq', 'Administrador', 'Sim', '(98) 98554-4543', 'São Luís', '05-12-2024-19-10-12-Perfil.png', '2024-05-28', 'Sim', '', 50, NULL, 60, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_permissoes`
--

CREATE TABLE `usuarios_permissoes` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuarios_permissoes`
--

INSERT INTO `usuarios_permissoes` (`id`, `usuario`, `permissao`) VALUES
(67, 11, 3),
(71, 11, 5),
(73, 11, 2),
(76, 14, 1),
(77, 14, 12),
(78, 15, 9),
(79, 15, 12),
(80, 15, 10),
(81, 18, 2),
(83, 18, 13),
(84, 18, 21),
(85, 18, 19),
(86, 18, 20),
(90, 18, 11),
(91, 18, 14),
(92, 18, 16),
(93, 18, 17),
(95, 18, 24),
(96, 18, 25),
(97, 16, 23),
(98, 16, 21),
(101, 11, 26),
(102, 11, 27),
(103, 18, 28),
(104, 24, 1),
(105, 24, 2),
(106, 24, 3),
(107, 24, 4),
(108, 24, 5),
(109, 24, 8),
(110, 24, 9),
(111, 24, 10),
(112, 24, 11),
(113, 24, 12),
(114, 24, 13),
(115, 24, 14),
(116, 24, 15),
(117, 24, 16),
(118, 24, 17),
(119, 24, 18),
(120, 24, 19),
(121, 24, 20),
(122, 24, 21),
(123, 24, 22),
(124, 24, 23),
(125, 24, 24),
(126, 24, 25),
(127, 24, 26),
(128, 24, 27),
(129, 24, 28);

-- --------------------------------------------------------

--
-- Estrutura para tabela `valor_parcial`
--

CREATE TABLE `valor_parcial` (
  `id` int(11) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data` date NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `anamnese`
--
ALTER TABLE `anamnese`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `arquivos`
--
ALTER TABLE `arquivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `caixas`
--
ALTER TABLE `caixas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `convenios`
--
ALTER TABLE `convenios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `dias`
--
ALTER TABLE `dias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `formas_pgto`
--
ALTER TABLE `formas_pgto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `frequencias`
--
ALTER TABLE `frequencias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `func_proc`
--
ALTER TABLE `func_proc`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `grupo_ana`
--
ALTER TABLE `grupo_ana`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico_paciente`
--
ALTER TABLE `historico_paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `horarios_agd`
--
ALTER TABLE `horarios_agd`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `itens_ana`
--
ALTER TABLE `itens_ana`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pagar`
--
ALTER TABLE `pagar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `procedimentos`
--
ALTER TABLE `procedimentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receber`
--
ALTER TABLE `receber`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receita`
--
ALTER TABLE `receita`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sangrias`
--
ALTER TABLE `sangrias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tratamentos`
--
ALTER TABLE `tratamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `anamnese`
--
ALTER TABLE `anamnese`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de tabela `arquivos`
--
ALTER TABLE `arquivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `caixas`
--
ALTER TABLE `caixas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `convenios`
--
ALTER TABLE `convenios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `dias`
--
ALTER TABLE `dias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de tabela `exames`
--
ALTER TABLE `exames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `formas_pgto`
--
ALTER TABLE `formas_pgto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `frequencias`
--
ALTER TABLE `frequencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `func_proc`
--
ALTER TABLE `func_proc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `grupo_acessos`
--
ALTER TABLE `grupo_acessos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `grupo_ana`
--
ALTER TABLE `grupo_ana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `historico_paciente`
--
ALTER TABLE `historico_paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `horarios_agd`
--
ALTER TABLE `horarios_agd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens_ana`
--
ALTER TABLE `itens_ana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `marketing`
--
ALTER TABLE `marketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `pagar`
--
ALTER TABLE `pagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `procedimentos`
--
ALTER TABLE `procedimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de tabela `receber`
--
ALTER TABLE `receber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `receita`
--
ALTER TABLE `receita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `sangrias`
--
ALTER TABLE `sangrias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tratamentos`
--
ALTER TABLE `tratamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `usuarios_permissoes`
--
ALTER TABLE `usuarios_permissoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT de tabela `valor_parcial`
--
ALTER TABLE `valor_parcial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
