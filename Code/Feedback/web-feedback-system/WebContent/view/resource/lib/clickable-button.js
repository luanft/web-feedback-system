/**
 * 
 */
$('input[name="optradio1"]')
    // bind a change-event handler using 'on()':
    .on('change', function(){
        // re-select the same elements:
        $('input[name="optradio1"]')
            // set the 'checked' property back to the default (on page-load) state:
            .prop('checked', function(){
                return this.defaultChecked;
            });
    });