
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require_tree .

$(document).ready(function() {
    $('#calendar').fullCalendar({
        header: {
            left: 'prev, next, today',
            center: 'title',
            right: 'month, agendaWeek, agendaDay'
        },
        editable: true, 
        selectable: true,
        selectHelper: true, 
        height: 600,
        width: 400,

        //ボタン文字列
        buttonText: {
            prev: '<',
            next: '>',
            today: '今日',
            month: '月',
            week: '週',
            day: '日'

        },
        // 月名称
        monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
        // 曜日略称
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        //月曜日開始
        firstDay:1,
        //agendaWeek, agendaDayの1時間4セル（15分間隔) で表示
        //開始時間を朝7時に設定
        scrollTime: '07:00:00',
        defaultView: 'month',
    });
});
