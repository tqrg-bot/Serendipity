// File referenced in:
// – include/admin/tpl/out_stack_loop.tpl

// Switches preview of image selected from media db by changing the
// container's background image
function change_preview(id) {
    var text_box = document.getElementById('serendipity[template][' + id + ']');
    var image_box = document.getElementById(id + '_preview'); 
    var filename = text_box.value;

    image_box.style.backgroundImage = 'url(' + filename + ')';
    image_box.style.backgroundRepeat = 'no-repeat';
}

// Opens media db image selection in new window
function choose_media(id) {
    window.open('serendipity_admin_image_selector.php?serendipity[htmltarget]=' + id + '&serendipity[filename_only]=true', 'ImageSel', 'width=800,height=600,toolbar=no,scrollbars=1,scrollbars,resize=1,resizable=1');
}