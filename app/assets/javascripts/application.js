
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery.turbolinks
//= require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require_tree .

$(document).ready(function() {
    create_event = function(title, start, end) {
        /*
        $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
            var token;
            if (!options.crossDomain) {
                token = $('meta[name="csrf-token"]').attr('content');
                if ( token ) {
                    return jqXHR.setRequestHeader('X-CSRF-Token', token);
                }
            }
        });
        */
        alert("確認中!"),
        $.ajax({
            type: 'POST',
            url:"/events/create",
            data: {
                title: title,
                start: start,
                end: end
            }
            // alert("create!"),
        }).done(function(data) {
            alert("登録しました!");
        }).fail(function(data) {
            alert("登録できませんでした。");
        });
    };

            
    $('#calendar').fullCalendar({
        header: {
            left: 'prev, next, today',
            center: 'title',
            right: 'month, agendaWeek, agendaDay'
        },
        navLinks: true,
        selectable: false,
        selectHelper: true, 
        height: 600,
        width: 400,

        select: function(start, end) {
            var title = prompt('ユーザー名');
            var eventData;
            if ( title ) {
                eventData = {
                    title: title,
                    start: start,
                    end: end
                };
                //登録したイベントをカレンダー上に永久に？くっつける？
                $('#calendar').fullCalendar('renderEvent', eventData, true);
      
                create_event(title, start, end);
            }
            //現在の選択したっていう場所をクリア
            $('#calendar').fullCalendar('unselect')
        },
        
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
        
        events: '/events.json',
        editable: false
    });
});
