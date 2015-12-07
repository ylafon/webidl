function clean_section_numbers() {
    $("a[href='#']").each(function (i, val) {
        var ref = val.previousElementSibling;
        var id = ref.getAttribute("href").substring(1);
        // we construct the new id...
        var newid = "h-" + id.toLowerCase();
        var container = document.getElementById(newid);
        if (container != null) {
            var secno = document.getElementById(newid).firstElementChild.firstElementChild;
            val.appendChild(secno.firstChild.cloneNode());
            val.setAttribute("href", "#" + id);
        } else {
            // this should never happen.
        }
    });
}
