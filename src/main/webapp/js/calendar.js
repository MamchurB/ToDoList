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