<!DOCTYPE html>
<html>
<head>
    <title>Attract Group</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            color: #333;
            font-size: 28px;
            margin-top: 100px;
        }
        .message {
            color: #777;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Привіт, <span style="color: #78c7ee;">Attract</span> Group!</h1>
    <div class="message">
        <br>
        <strong>1.</strong> В ході виконання цього завдання був створений <strong>docker-compose.yml</strong> файл для визначення і налаштування сервісів NGINX і PHP.<br><br>
        <strong>2.</strong> Для сервісу NGINX було створено конфігураційний файл <strong>(nginx.conf)</strong>, який визначає налаштування сервера NGINX. Він містить такі основні налаштування:<br><br>
        - Сервер слухає вхідні з'єднання порту 80; <br>
        - Визначено кореневу директорію веб-програми;<br>
        - Налаштовані обробники запитів, щоб NGINX перенаправляв запити на PHP-скрипти для обробки. <br><br>
        <strong>3.</strong> Для сервісу PHP було використано офіційний образ PHP-FPM.<br><br> 
        <strong>4.</strong> В даному випадку, ми монтуємо директорію <strong>./php</strong> в <strong>/var/www/html</strong>, щоб PHP-скрипти були доступні для виконання. <br><br>
        <strong>5.</strong> Був застосований <strong>swarm mode</strong> для оркестрації контейнерів, забезпечуючи масштабованість та відмовостійкість.<br><br>
        <strong>6.</strong> Налаштовано обмеження ресурсів для кожного сервісу на основі доступної оперативної пам'яті (RAM) та процесорних ресурсів (CPU).<br><br>
        <strong>7.</strong> Реалізовано налаштування реєстрації логів проекту із стандартного виведення <strong>(stdout)</strong> контейнерів, забезпечуючи можливість логування та відстеження подій та помилок програми.<br><br>
        В результаті, розгортання даного Docker-додатку дозволяє запустити веб-сервер NGINX та веб-додаток на PHP, забезпечує контроль ресурсів <br>
        та налаштування логування для проектних логів.<br><br><br>
        <a href="https://www.linkedin.com/in/danylo-ivanov-13bb20217/" style="color: #0077ff;">Моя сторінка в Linkedin</a><br>
        <a href="https://github.com/beatplugg" style="color: #0077ff;">Мій GitHub</a>
    </div>
</body>
</html>
