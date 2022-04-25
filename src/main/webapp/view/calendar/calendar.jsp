<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"
      >
<head>
    <meta charset='utf-8' content="Cory Sanoy" name="Author" />

    <script>
        var tasks = ${events};
        $(document).ready(function() {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultDate: '2022-06-01',
                editable: true,
                eventLimit: true,
                events: tasks,
            });

        });

    </script>

    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id='calendar' th:id="calendar"></div>
</body>
</html>
