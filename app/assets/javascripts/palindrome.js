//= require jquery
//= require jquery_ujs

(function(){
    'use strict';

    $(window).one('load', function() {
        let $Form = $('#form');
        let $Table = $('#table');
        let $Error = $('#error');

        $Form.on('submit', function() {
            let $HTML = '';
            $Table.find('tr:not(:first)').remove();
            $.get('/palindrome/input.json', $Form.serialize(), function($JSON) {
                if($JSON['solution'].length === 0) {
                    $Table.hide();
                    $Error.show();
                } else {
                    console.log($JSON['solution']);
                    $.each($JSON['solution'], function($NULL, $Value) {
                        $HTML += '<tr>\
                        <td>' + $Value[0] + '</td>\
                        <td>' + $Value[1]+ '</td>\
                    </tr>';
                    });
                    $Table.show().append($HTML);
                    $Error.hide();
                }
            });
        });
    });
})();