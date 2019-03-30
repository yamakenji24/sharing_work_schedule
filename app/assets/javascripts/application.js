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
        $.ajax({
            type: 'POST',
            url:"/events/create",
            data: {
                title: title,
                start: String(start),
                end: String(end),
                "authenticity_token": $("#authenticy_token").val()
            }
            // alert("create!"),
        }).done(function(data) {
            alert("登録しました!");
        }).fail(function(data) {
            alert("登録できませんでした。");
        });
    };

    update_event = function(id, title, start, end) {
        alert("move!");
        $.ajax({
            type: 'POST',
            url:"/events/update",
            data: {
                id: id,
                title: title,
                start: String(start),
                end: String(end),
                "authenticity_token": $("#authenticity_token").val()
            }
        }).done(function(data) {
            alert("更新しました!");
        }).fail(function(data) {
            alert("更新できませんでした。");
        });
    };
            
    $('#calendar').fullCalendar({
        header: {
            left: 'prev, next, today',
            center: 'title',
            right: 'month, agendaWeek, agendaDay, listWeek'
        },
        navLinks: true,
        selectable: true,
        selectHelper: true, 
        height: 600,
        width: 400,
        draggable: true,

        // 幅選択
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
        
        // イベントクリック
        eventClick: function(event) {
            var id = event.id
            
        },

        // イベントをドラッグ＆ドロップした際に実行
        eventDrop: function(event) {
            var updateevent;
            updateevent= {
                id: event.id,
                title: event.title,
                start: event.start,
                end: event.end,
            };
            $('#calendar').fullCalendar('refetchEvents');
            update_event(id, title, start, end);
            //$('#calendar').fullCalendar('unselect')
        },
        
        eventAfterRender: function(event, element, view) {
            $(element).css('width', '100px');
        },
        
        //ボタン文字列
        buttonText: {
            prev: '<',
            next: '>',
            today: '今日',
            month: '月',
            week: '週',
            day: '日',
            list: 'リスト'
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
        editable: true
    });
});
