<?php 

require_once("conexao.php");

$email = filter_var($_POST['email'], @FILTER_SANITIZE_STRING);

$query = $pdo->prepare("SELECT * from usuarios where email = :email");
$query->bindValue(":email", "$email");
$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);

$linhas = @count($res);

if($linhas > 0){

	$senha = $res[0]['senha'];

	//ENVIAR O EMAIL COM A SENHA

	$nova_senha = rand(100000, 100000000);
	$senha_crip = password_hash($nova_senha, PASSWORD_DEFAULT);
	$query = $pdo->prepare("UPDATE usuarios SET senha_crip = '$senha_crip' where email = :email");
	$query->bindValue(":email", "$email");
	$query->execute();

	$destinatario = $email;

	$assunto = $nome_sistema . ' - Recuperação de Senha';

	$mensagem = 'Sua senha é ' .$nova_senha;

	$cabecalhos = "From: ".$email_sistema;



	@mail($destinatario, $assunto, $mensagem, $cabecalhos);

	echo 'Recuperado';

}else{

echo 'Email não Cadastrado!';

}	

 ?>

