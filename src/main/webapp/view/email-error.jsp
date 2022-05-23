<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BusyMan - Registration Error</title>
    <link id="theme" rel="stylesheet" href="/todolist/css/theme-1.css">
    <link rel="stylesheet" href="/todolist/css/style.css">
    <script type="text/javascript">
        $(document).ready(function() {
            var selItem = localStorage.getItem("locales");
            $('#locales').val(selItem ? selItem : 'en');
            $("#locales").change(function() {
                var selectedOption = $('#locales').val();
                if (selectedOption) {
                    localStorage.setItem("locales", selectedOption);
                    window.location.replace('?lang=' + selectedOption);

                }
            });
        });
    </script>
</head>

<body class="calendar__body">
<div class="wrapper">

    <main class="page">
        <div class="container container__message">
            <div class="about-us__block">
                <div class="about-us__title">
                    Registration Error
                </div>
                <div class="about-us__main">
                    <div class="about-us__img">
                        <img src="../images/main.png" alt="main photo">
                    </div>
                    <div class="about-us__info">
                        <div class="about-us__text">
                            <span>Something went wrong...</span>
                            <div>Please try again later :(</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</div>
<script src="/todolist/js/theme.js"></script>
</body>

</html>