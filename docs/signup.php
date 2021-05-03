// <?php
//     if (isset($_POST['submit'])) {
//         $email = $_POST['email'];
//         echo "<p> " . $email . "</p>”;
//         echo "<p> HelloSDFSDF world </p>";
//     }
// ?>

<?php

$errors = [];
$data = [];

if (empty($_POST['email'])) {
    $errors['email'] = 'Email is required.';
}


if (!empty($errors)) {
    $data['success'] = false;
    $data['errors'] = $errors;
} else {
    $data['success'] = true;
    $data['message'] = 'Success!';
}

echo json_encode($data);
