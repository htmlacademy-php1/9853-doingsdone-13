USE doingsdone;

INSERT INTO users (email,  password, name)
VALUES ('maria@yandex.ru', 'qwerty', 'maria'),
       ('vanya@yandex.ru', '12345', 'ivan');


INSERT INTO projects (title, user_id)
VALUES ('Входящие', 2),
       ('Учеба', 2),
       ('Работа', 1),
       ('Домашние дела', 1),
       ('Авто', 1);


INSERT INTO tasks ( title, deadline_date, user_id, project_id )
VALUES ('Собеседование в IT компании', '2019-12-01', 1, 1 ),
       ('Выполнить тестовое задание', '2019-11-06', 1, 1),
       ('Сделать задание первого раздела', '2019-12-21', 1, 1),
       ('Встреча с другом', '2019-12-22', 1, 1),
       ('Купить корм для кота', NULL, 1, 1),
       ('Заказать пиццу', NULL, 1, 1);

/*
Получить список из всех проектов для одного пользователя
 */
SELECT * FROM projects
WHERE user_id = 2;

/*
Получить список из всех задач для одного проекта
 */
SELECT * FROM tasks
LEFT JOIN projects ON projects.id = tasks.project_id
WHERE projects.id  = 1;

/*
 Пометить задачу как выполненную
 */
UPDATE tasks SET status = 1
WHERE id = 1;

/*
 Обновить название задачи по её идентификатору
 */
UPDATE tasks SET title = 'Сходить в университет'
WHERE id = 3;