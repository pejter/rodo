<?php
require '../vendor/autoload.php';
require '../middleware/HttpBasicAuth.php';

use \Slim\Slim;
$db_host = 'localhost';
$db_name = 'rodo';
$db_user = 'root';
$db_pass = 'pass';

//application config
$app = new \Slim\Slim(array(
	'mode' => 'development',
	'debug' => true,
	'log.enabled' => true,
	'log.level' => \Slim\Log::DEBUG,
	'templates.path' => '../templates',
	'view' => new \Slim\Views\Twig(),
));
$app->add(new \Slim\Middleware\HttpBasicAuth(array(
	"path" => "/admin",
	"realm" => "Admin Panel",
	"users" => array(
		"pejter" => "814ff90c56a74b5e2bb48cd240331867a95357e1",
		"rodo" => "2a4a70fa1f6954596ff7e60d49ada1f441c29cef"
	)
)));
$view = $app->view();
$view->parserOptions = array(
	'debug' => true,
	'charset' => 'utf-8',
	'cache' => '../templates/cache',
	'auto_reload' => true,
	'strict_variables' => false,
	'autoescape' => true
);
$view->parserExtensions = array(
	new \Slim\Views\TwigExtension(),
);
$app->db = new PDO('mysql:host='.$db_host.';dbname='.$db_name, $db_user, $db_pass);
$app->owner_email = 'joaorodo@gmail.com';

function projectSubmit(){
	return function($id){
	$app = \Slim\Slim::getInstance();
	$post = $app->request->post();
	$mode = NULL;


	$oq = $app->db->query("SELECT sidebar_image,large_image FROM main_project WHERE id=".intval($id).";");
	$old_data = $oq->fetch(PDO::FETCH_ASSOC);
	//construct update/insert query
	if($id == 0){
		$q = $app->db->prepare(
			"INSERT INTO main_project(id, name, slug, content_html, sidebar_image, large_image, \"order\") VALUES (:id, :name, :slug, :content_html, :sidebar_image, :large_image, :order;",
			array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY)
		);
		$mode = 'insert';
	} else {
		$q = $app->db->prepare(
			"UPDATE main_project SET name=:name, slug=:slug, content_html=:content_html, sidebar_image=:sidebar_image, large_image=:large_image, \"order\"=:order WHERE id=:id;",
			array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY)
		);
		$mode = 'update';
	}


	if (!isset($_FILES['sidebar_image']['error']) ||
		is_array($_FILES['sidebar_image']['error'])
	) {
		throw new Exception('Invalid parameters.');
	}

	// Check $_FILES['sidebar_image']['error'] value.
	switch ($_FILES['sidebar_image']['error']) {
		case UPLOAD_ERR_OK:
			$uploadDir = '/project/sidebar/';
			$name = $uploadDir.$_FILES['sidebar_image']['name'];
			$tmp_name = $_FILES['sidebar_image']['tmp_name'];
			if(!move_uploaded_file($tmp_name,$name)){
				throw new Exception("Cannot move file '$tmp_name' to permanent location");
			}
			if($old_data['sidebar_image'] != $name){
				unlink($old_data['sidebar_image']);
			}
			$update->bindValue(':sidebar_image', $_FILES['sidebar_image']['name'], PDO::PARAM_STR);
			break;
		case UPLOAD_ERR_NO_FILE:
			if($mode == 'insert'){
				throw new Exception("No file selected");
			} else {
				$q->bindValue(':sidebar_image', $old_data['sidebar_image'], PDO::PARAM_STR);
				break;
			}
		case UPLOAD_ERR_INI_SIZE:
		case UPLOAD_ERR_FORM_SIZE:
			throw new Exception('Exceeded filesize limit.');
		default:
			throw new Exception('Unknown errors.');
	}

	switch ($_FILES['large_image']['error']) {
		case UPLOAD_ERR_OK:
			$uploadDir = '/project/large/';
			$name = $uploadDir.$_FILES['large_image']['name'];
			$tmp_name = $_FILES['large_image']['tmp_name'];
			if(!move_uploaded_file($tmp_name,$name)){
				throw new Exception("Cannot move file '$tmp_name' to permanent location");
			}
			if($old_data['large_image'] != $name){
				unlink($old_data['sidebar_image']);
			}
			$update->bindValue(':large_image', $_FILES['large_image']['name'], PDO::PARAM_STR);
			break;
		case UPLOAD_ERR_NO_FILE:
			if($mode == 'insert'){
				throw new Exception("No file selected");
			} else {
				$q->bindValue(':large_image', $old_data['large_image'], PDO::PARAM_STR);
				break;
			}
		case UPLOAD_ERR_INI_SIZE:
		case UPLOAD_ERR_FORM_SIZE:
			throw new Exception('Exceeded filesize limit.');
		default:
			throw new Exception('Unknown errors.');
	}

	//bind rest of variables
	$q->bindValue(':name', $post['name'],PDO::PARAM_STR);
	$q->bindValue(':id', $post['id'], PDO::PARAM_INT);
	$q->bindValue(':order', $post['order'], PDO::PARAM_INT);
	$q->bindValue(':slug', $post['slug'], PDO::PARAM_STR);
	$q->bindValue(':content_html', $post['content_html'], PDO::PARAM_STR);

	//execute and catch errors
	$q->execute();
	if($q->errorCode() !== '00000'){
		ob_start();
		var_dump($post);
		$contents = ob_get_contents();
		ob_end_clean();
		$app->getLog()->debug("Post: ".$contents);
		$info = $q->errorInfo();
		throw new Exception($info[2]);

	}
	$app->redirect($app->urlFor('admin-index'));
	};
};

//public routes
$app->get('/', function() use ($app){
	$app->render('main/index.html');
})->name('index');

$app->get('/pricing', function() use ($app){
	$app->render('main/pricing.html');
})->name('pricing');

$app->get('/projects', function() use ($app){
	$q = $app->db->query("SELECT * FROM main_project ORDER BY \"order\";");
	$projects = $q->fetchAll(PDO::FETCH_ASSOC);
	$app->render('main/projects.html', array(
		'projects' => $projects
	));
})->name('projects');

$app->get('/contact', function() use ($app){
	$app->render('main/contact.html');
})->name('contact');

$app->post('/contact', function() use ($app){
	$post = $app->request->post();
	if(sizeof($post['how_found']) == 0) $post['how_found'] = "Left empty";
	if(sizeof($post['special_requests']) == 0) $post['special_requests'] = "Left empty";

	$msg = "Name:".$post['name'].PHP_EOL;
	$msg .= "Email: ".$post['email'].PHP_EOL;
	$msg .= "Package: ".$post['package'].PHP_EOL;
	$msg .= "\nYour needs:\n".$post['needs'].PHP_EOL;
	$msg .= "\nSpecial requests:\n".$post['special_requests'].PHP_EOL;
	$msg .= "\nHow did you find me? ".$post['how_found'];

	mail($app->owner_email, 'Contact Request - '.$post['name'], $msg);
	$app->getLog()->debug(Date(time())." [debug] Sent email to".$app->owner_email." with message:\n".$msg);
	$app->render('main/contact_sent.html');
});

//admin routes
$app->group('/admin', function() use ($app){
	$app->get('/', function() use ($app){
		$q = $app->db->query("SELECT * FROM main_project ORDER BY \"order\";");
		$projects = $q->fetchAll(PDO::FETCH_ASSOC);
		$app->render('admin/index.html', array(
			'projects' => $projects
		));
	})->name('admin-index');

	$app->get('/project/add', function() use ($app){
		$project = array();
		$app->render('admin/project.html', array(
			'project' => $project
		));
	})->name('project-add');

	$app->get('/project/:id/delete', function($id) use ($app){
		$q = $app->db->query("SELECT * FROM main_project WHERE id='$id';");
		$project = $q->fetch(PDO::FETCH_ASSOC);
		$app->render('admin/project-delete.html', array(
			'project' => $project
		));
	})->name('project-delete');

	$app->post('/project/:id/delete', function($id) use ($app){
		$r = $app->db->query("DELETE FROM main_project WHERE id='$id';");
	});

	$app->post('/project/add', projectSubmit());

	$app->get('/project/:id', function($id) use ($app){
		$q = $app->db->query("SELECT * FROM main_project WHERE id='$id';");
		$project = $q->fetch(PDO::FETCH_ASSOC);
		$app->render('admin/project.html', array(
			'project' => $project
		));
	})->name('project-edit');

	$app->post('/project/:id', projectSubmit($id));

});

$app->notFound(function() use ($app){
	$app->render('404.html');
});

$app->run();
?>
