function initSelect() {
    $('select.select2it').each(function () {
        $(this).next('.select2-container').remove();
        $(this).select2({
            theme: 'bootstrap',
            tags: true,
            allowClear: false,
            placeholder: 'This is my placeholder',
            width: '100%',
            // dropdownCss: ,
        });
    });
}

document.addEventListener("turbolinks:load", () => {
    initSelect(
        $(document).ready(function() { $("#visit_client_id").select2(); })
    );
});