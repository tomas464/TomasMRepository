<?php
header('Content-Type: application/json; charset=utf-8');

$data = json_decode(file_get_contents('php://input'), true);

$text = $data['text'];
$key  = $data['key'];

$hash = sha1($text . "\n" . $key);

$signed  = rtrim($text, "\r\n") . "\n\n";
$signed .= "---SIGNATURE---\n";
$signed .= "KEY: " . $key . "\n";
$signed .= "HASH: " . $hash . "\n";

echo json_encode([
    "success" => true,
    "signedText" => $signed
]);
