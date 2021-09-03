<?php

require_once 'helpers.php';

define('HOURS', 24);
$showCompletedTasks = rand(0, 1);
$checkCompletedAttribute = $showCompletedTasks ? "checked" : "";
$categories = ["Входящие", "Учеба", "Работа", "Домашние дела", "Авто"];
$pageTitle = "Дела в порядке";

$tasks = [
    [
        'title' => 'Собеседование в IT компании',
        'date' => '01.12.2019',
        'category' => 'Работа',
        'status' => false
    ],
    [
        'title' => 'Выполнить тестовое задание',
        'date' => '25.12.2021',
        'category' => 'Работа',
        'status' => false
    ],
    [
        'title' => 'Сделать задание первого раздела',
        'date' => '21.12.2019',
        'category' => 'Учеба',
        'status' => true
    ],
    [
        'title' => 'Встреча с другом',
        'date' => '22.12.2019',
        'category' => '	Входящие',
        'status' => false
    ],
    [
        'title' => 'Купить корм для кота',
        'date' => null,
        'category' => 'Домашние дела',
        'status' => false
    ],
    [
        'title' => 'Заказать пиццу',
        'date' => null,
        'category' => 'Домашние дела',
        'status' => false
    ],
];

function countTasks($tasks, $category)
{
    $count = 0;
    foreach ($tasks as $value) {
        if ($value['category'] == $category) {
            $count++;
        }
    }
    return $count;
}

function countHours($date)
{
    $diffTime = strtotime($date) - time();
    return floor($diffTime / 3600);
}

function isTaskImportant($taskDate)
{
    return countHours($taskDate) <= HOURS ? true : false;
}


$pageContent = include_template('main.php', [
    'categories' => $categories,
    'tasks' => $tasks,
    'checkCompletedAttribute' => $checkCompletedAttribute,
    'showCompletedTasks' => $showCompletedTasks
]);

$pageLayout = include_template('layout.php', [
    'pageTitle' => $pageTitle,
    'content' => $pageContent,
]);

print($pageLayout);
