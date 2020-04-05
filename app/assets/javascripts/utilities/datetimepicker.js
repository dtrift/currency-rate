$(document).on('turbolinks:load', function() {
    $('#datetimepicker1').datetimepicker({
        format: 'MMMM D, YYYY h:mm A',
        stepping: 1,
        minDate: Date(),
        maxDate: new Date(Date.now() + (365 * 24 * 60 * 60 * 1000)),
        sideBySide: true,
        icons: {
            up: 'fas fa-arrow-up',
            down: 'fas fa-arrow-down',
            previous: 'fas fa-chevron-left',
            next: 'fas fa-chevron-right',
            close: 'fas fa-times'
        },
        buttons: { showClose: true }
    });

    $('#datetimepicker2').datetimepicker({
        format: 'MMMM D, YYYY h:mm A',
        stepping: 1,
        useCurrent: false,
        sideBySide: true,
        icons: {
            up: 'fas fa-arrow-up',
            down: 'fas fa-arrow-down',
            previous: 'fas fa-chevron-left',
            next: 'fas fa-chevron-right',
            close: 'fas fa-times'
        },
        buttons: { showClose: true }
    });

    $("#datetimepicker1").on("change.datetimepicker", function (e) {
        $('#datetimepicker2').datetimepicker('minDate', e.date);
        console.log(e.date);
    });

    $("#datetimepicker2").on("change.datetimepicker", function (e) {
        $('#datetimepicker1').datetimepicker('maxDate', e.date);
    });
});
